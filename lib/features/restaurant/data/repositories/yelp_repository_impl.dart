import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/core/utils/app_exceptions.dart';
import 'package:restaurant_tour/core/utils/app_failures.dart';
import 'package:restaurant_tour/features/restaurant/data/data_sources/remote_datasource.dart';
import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant/domain/repositories/yelp_repository.dart';

class YelpRepositoryImpl implements YelpRepository {
  final RemoteDatasource datasource;

  YelpRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurantsFromRepo(
      {int offset = 0}) async {
    try {
      List<Restaurant> restaurants = [];
      final result = await datasource.getRestaurants(offset: offset);
      for (final r in result["data"]["search"]["business"]) {
        restaurants.add(Restaurant.fromJson(r));
      }
      return Right(restaurants);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(AppFailure());
    }
  }

  /// Returns a response in this shape
  /// {
  /// "data": {
  ///   "search": {
  ///     "total": 5056,
  ///     "business": [
  ///       {
  ///         "id": "faPVqws-x-5k2CQKDNtHxw",
  ///         "name": "Yardbird Southern Table & Bar",
  ///         "price": "$$",
  ///         "rating": 4.5,
  ///         "photos": [
  ///           "https:///s3-media4.fl.yelpcdn.com/bphoto/_zXRdYX4r1OBfF86xKMbDw/o.jpg"
  ///         ],
  ///         "reviews": [
  ///           {
  ///             "id": "sjZoO8wcK1NeGJFDk5i82Q",
  ///             "rating": 5,
  ///             "user": {
  ///               "id": "BuBCkWFNT_O2dbSnBZvpoQ",
  ///               "image_url": "https:///s3-media2.fl.yelpcdn.com/photo/v8tbTjYaFvkzh1d7iE-pcQ/o.jpg",
  ///               "name": "Gina T.",
  ///               "text": "I love this place! The food is amazing and the service is great."
  ///             }
  ///           },
  ///           {
  ///             "id": "okpO9hfpxQXssbTZTKq9hA",
  ///             "rating": 5,
  ///             "user": {
  ///               "id": "0x9xu_b0Ct_6hG6jaxpztw",
  ///               "image_url": "https:///s3-media3.fl.yelpcdn.com/photo/gjz8X6tqE3e4praK4HfCiA/o.jpg",
  ///               "name": "Crystal L.",
  ///               "text": "Greate place to eat"
  ///             }
  ///           },
  ///        ...
  ///     ]
  ///   }
  /// }
  ///
}
