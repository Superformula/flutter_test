import 'entities.dart';

class ReviewEntity {
  final String id;
  final int rating;
  final String text;
  final UserEntity user;

  ReviewEntity({
    required this.id,
    required this.rating,
    required this.text,
    required this.user,
  });
}
