import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import 'models.dart';

class ReviewModel {
  final String id;
  final int rating;
  final String text;
  final UserModel user;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.text,
    required this.user,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      id: entity.id,
      rating: entity.rating,
      text: entity.text,
      user: UserModel.fromEntity(entity.user),
    );
  }

  factory ReviewModel.fromJson(Map json) {
    try {
      return ReviewModel(
        id: json['id'] ?? '',
        rating: json['rating'] ?? 5,
        text: json['text'] ?? '',
        user: UserModel.fromJson(json['user']),
      );
    } catch (_) {
      throw DomainError.unexpected;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'text': text,
      'user': user.toJson(),
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      rating: rating,
      text: text,
      user: user.toEntity(),
    );
  }
}
