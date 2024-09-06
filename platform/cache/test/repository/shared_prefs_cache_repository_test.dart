import 'package:cache/repository/shared_prefs_cache_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPrefsCacheReppository cacheRepository;
  late MockSharedPreferences mockSharedPreferences;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    mockSharedPreferences = MockSharedPreferences();
    cacheRepository = SharedPrefsCacheReppository(pref: mockSharedPreferences);
  });

  group('SharedPrefsCacheRepository', () {
    test(
        'Given a key exists in SharedPreferences, when getString is called, then it returns the correct value',
        () async {
      when(() => mockSharedPreferences.getString('testKey'))
          .thenReturn('testValue');

      final result = await cacheRepository.getString('testKey');

      expect(result, 'testValue');
      verify(
        () => mockSharedPreferences.getString('testKey'),
      ).called(1);
    });

    test(
        'Given a key does not exist in SharedPreferences, when getString is called, then it returns null',
        () async {
      when(() => mockSharedPreferences.getString('testKey')).thenReturn(null);

      final result = await cacheRepository.getString('testKey');

      expect(result, isNull);
      verify(
        () => mockSharedPreferences.getString('testKey'),
      ).called(1);
    });

    test(
        'Given a key-value pair, when setString is called, then it sets the value in SharedPreferences',
        () {
      when(() => mockSharedPreferences.setString('testKey', 'testValue'))
          .thenAnswer(
        (invocation) => Future.value(true),
      );

      cacheRepository.setString('testKey', 'testValue');

      verify(() => mockSharedPreferences.setString('testKey', 'testValue'))
          .called(1);
    });

    test('When reset is called, then it clears SharedPreferences', () {
      when(() => mockSharedPreferences.clear())
          .thenAnswer((invocation) => Future.value(true));

      cacheRepository.reset();

      verify(() => mockSharedPreferences.clear()).called(1);
    });

    test(
        'Given a failure to set a value, when setString is called, then it throws an exception',
        () {
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenThrow(Exception('Failed to set value'));

      expect(() => cacheRepository.setString('testKey', 'testValue'),
          throwsA(isA<Exception>()));
    });

    test(
        'Given a failure to clear the cache, when reset is called, then it throws an exception',
        () {
      when(() => mockSharedPreferences.clear())
          .thenThrow(Exception('Failed to clear cache'));

      expect(() => cacheRepository.reset(), throwsA(isA<Exception>()));
    });
  });
}
