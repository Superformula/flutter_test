import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/infra/cache/cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late LocalStorageAdapter sut;
  late String key;
  late String value;

  setUp(() {
    key = 'any_key';
    value = 'any_value';
    SharedPreferences.setMockInitialValues({key: value});
    sut = LocalStorageAdapter();
  });

  group('fetch', () {
    test('Should return the value from SharedPreferences', () async {
      final result = await sut.fetch(key);
      expect(result, value);
    });

    test('Should return null if the key is not found', () async {
      final result = await sut.fetch('test');
      expect(result, isNull);
    });
  });

  group('save', () {
    test('Should save the value in SharedPreferences', () async {
      const key = 'test_key';
      const value = 'test_value';
      await sut.save(key: key, value: value);
      final result = await sut.fetch(key);
      expect(result, value);
    });
  });
}
