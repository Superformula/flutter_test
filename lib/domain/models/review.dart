import 'package:restaurant_tour/domain/models/user.dart';

class Review {
  final String? id;
  final int? rating;
  final String? text;
  final User? user;

  const Review({
    this.id,
    this.rating,
    this.user,
    this.text,
  });
}
