// coverage:ignore-file
///Entity defining the data
class RestaurantEntity {
  String id;
  String name;
  String price;
  double rating;
  List<String> photos;
  List<Category> categories;
  List<Hours> hours;
  List<Review> reviews;
  Location location;

  RestaurantEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.photos,
    required this.categories,
    required this.hours,
    required this.reviews,
    required this.location,
  });
}

class Category {
  final String title;
  Category({required this.title});
}

class Hours {
  final bool isOpenNow;
  Hours({required this.isOpenNow});
}

class User {
  final String id;
  final String imageUrl;
  final String name;

  User({
    required this.id,
    required this.imageUrl,
    required this.name,
  });
}

class Review {
  final String id;
  final int rating;
  final String text;
  final User user;

  Review({
    required this.id,
    required this.rating,
    required this.text,
    required this.user,
  });
}

class Location {
  final String formattedAddress;

  Location({required this.formattedAddress});
}
