import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';

class UserModel {
  final String id;
  final String imageUrl;
  final String name;

  UserModel({
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      imageUrl: user.imageUrl,
      name: user.name,
    );
  }

  factory UserModel.fromJson(Map json) {
    try {
      return UserModel(
        id: json['id'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        name: json['name'] ?? '',
      );
    } catch (_) {
      throw DomainError.unexpected;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      imageUrl: imageUrl,
      name: name,
    );
  }
}
