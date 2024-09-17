import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/data/models/models.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/domain/helpers/helpers.dart';

import '../../core/factories.dart';

void main() {
  late Map userJson;
  late UserModel userModel;
  late UserEntity userEntity;

  setUp(() {
    userJson = makeUserJson();
    userModel = makeUserModel();
    userEntity = makeUserEntity();
  });

  test('Should create UserModel object when json is valid', () async {
    final json = UserModel.fromJson(userJson);
    expect(json, isA<UserModel>());
  });

  test('Should create UserEntity object from UserModel object', () async {
    final json = UserModel.fromEntity(userEntity);
    expect(json, isA<UserModel>());
  });

  test('Should throw a unexpected error when json is not valid', () async {
    expect(() => UserModel.fromJson({'id': 33}), throwsA(DomainError.unexpected));
  });

  test('Should create a UserEntity object', () async {
    final result = userModel.toEntity();
    expect(result, isA<UserEntity>());
  });
}
