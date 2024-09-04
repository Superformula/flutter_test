import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import '../domain/models/restaurant.dart';
import '../domain/repository/get_restaurant/errors/get_restaurant_errors.dart';
import '../domain/repository/get_restaurant/get_restaurants_repository.dart';

const _apiKey =
    'II5sTdR6l3n9ALgsBGhvIDXf8WN1ncb5hTpm_Ssi3GronE785_s6dwsNbIUcTkJdOlsuq56Vo_NPQPxUdb6GE1j6uugsLH7pWtIIyYfkSxnKVntsDzGPwh2Od4LXZnYx';

class YelpRepository implements GetRestaurantsRepository {
  late Dio dio;

  YelpRepository({
    @visibleForTesting Dio? dio,
  }) : dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://api.yelp.com',
                headers: {
                  'Authorization': 'Bearer $_apiKey',
                  'Content-Type': 'application/graphql',
                },
              ),
            );

  /// Returns a response in this shape
  //  {
  //  "data": {
  //    "search": {
  //      "total": 5056,
  //      "business": [
  //        {
  //          "id": "faPVqws-x-5k2CQKDNtHxw",
  //          "name": "Yardbird Southern Table & Bar",
  //          "price": "$$",
  //          "rating": 4.5,
  //          "photos": [
  //            "https:///s3-media4.fl.yelpcdn.com/bphoto/_zXRdYX4r1OBfF86xKMbDw/o.jpg"
  //          ],
  //          "reviews": [
  //            {
  //              "id": "sjZoO8wcK1NeGJFDk5i82Q",
  //              "rating": 5,
  //              "user": {
  //                "id": "BuBCkWFNT_O2dbSnBZvpoQ",
  //                "image_url": "https:///s3-media2.fl.yelpcdn.com/photo/v8tbTjYaFvkzh1d7iE-pcQ/o.jpg",
  //                "name": "Gina T.",
  //                "text": "I love this place! The food is amazing and the service is great."
  //              }
  //            },
  //            {
  //              "id": "okpO9hfpxQXssbTZTKq9hA",
  //              "rating": 5,
  //              "user": {
  //                "id": "0x9xu_b0Ct_6hG6jaxpztw",
  //                "image_url": "https:///s3-media3.fl.yelpcdn.com/photo/gjz8X6tqE3e4praK4HfCiA/o.jpg",
  //                "name": "Crystal L.",
  //                "text": "Greate place to eat"
  //              }
  //            },
  //         ...
  //      ]
  //    }
  //  }
  ///
  ///

  @override
  Future<Either<GetRestaurantError, RestaurantQueryResult>> getRestaurants(
      {int offset = 0}) async {
    try {
      await Future.delayed(Duration(seconds: 1));

      final Map<String, dynamic> response = {
        "data": {
          "search": {
            "total": 5056,
            "business": [
              {
                "id": "faPVqws-x-5k2CQKDNtHxw",
                "name": "Yardbird Southern Table & Bar",
                "price": "\$\$",
                "rating": 4.5,
                "photos": [
                  "https:///s3-media4.fl.yelpcdn.com/bphoto/_zXRdYX4r1OBfF86xKMbDw/o.jpg"
                ],
                "location": {
                  "formatted_address": "102 Lakeside Ave Seattle, WA 98122"
                },
                "reviews": [
                  {
                    "id": "sjZoO8wcK1NeGJFDk5i82Q",
                    "rating": 5,
                    "user": {
                      "id": "BuBCkWFNT_O2dbSnBZvpoQ",
                      "image_url":
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      "name": "Gina T.",
                    },
                    "text":
                        "I love this place! The food is amazing and the service is great."
                  },
                  {
                    "id": "okpO9hfpxQXssbTZTKq9hA",
                    "rating": 5,
                    "user": {
                      "id": "0x9xu_b0Ct_6hG6jaxpztw",
                      "image_url":
                          "https://images.unsplash.com/photo-1584999734482-0361aecad844?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      "name": "Crystal L.",
                    },
                    "text": "Greate place to eat"
                  },
                ]
              }
            ]
          }
        }
      };

      // final response = await dio.post<Map<String, dynamic>>(
      //   '/v3/graphql',
      //   data: _getQuery(offset),
      // );
      return Right(RestaurantQueryResult.fromJson(response['data']['search']));
    } catch (e) {
      return Left(GetRestaurantError(error: e.toString()));
    }
  }

  String _getQuery(int offset) {
    return '''
query getRestaurants {
  search(location: "Las Vegas", limit: 20, offset: $offset) {
    total    
    business {
      id
      name
      price
      rating
      photos
      reviews {
        id
        rating
        text
        user {
          id
          image_url
          name
        }
      }
      categories {
        title
        alias
      }
      hours {
        is_open_now
      }
      location {
        formatted_address
      }
    }
  }
}
''';
  }
}
