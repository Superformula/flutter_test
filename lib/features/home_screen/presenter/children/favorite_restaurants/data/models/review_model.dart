import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/data/models/user_model.dart';
import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.id,
    required super.rating,
    required super.text,
    required super.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'text': text,
      'user': user.toMap(),
    };
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? '',
      rating: json['rating'] ?? 0.0,
      text: json['text'] ?? '',
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
