import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/data/models/user_model.dart';

class ReviewEntity {
  const ReviewEntity({
    required this.id,
    required this.rating,
    required this.text,
    required this.user,
  });

  final String id;
  final int rating;
  final String text;
  final UserModel user;
}
