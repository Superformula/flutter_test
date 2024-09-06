import 'package:either_dart/either.dart';
import '../domain/models/restaurant.dart';
import '../domain/repository/get_restaurant/errors/get_restaurant_errors.dart';
import '../domain/repository/get_restaurant/get_restaurants_repository.dart';

// It is mocked cause i was receiving daily limit Exception after 3/5 requests :
class MockedRestaurantRepository implements GetRestaurantsRepository {
  @override
  Future<Either<GetRestaurantError, RestaurantQueryResult>> getRestaurants(
      {int offset = 0}) async {
    try {
      final Map<String, dynamic> response = {
        "data": {
          "search": {
            "total": 5056,
            "business": [
              {
                "id": "faPVqws-x-5k2CQKDNtHxw",
                "name": "Yardbird Southern Table & Bar super big name",
                "price": "\$\$",
                "rating": 4.5,
                "photos": ["https://picsum.photos/250?image=9"],
                "location": {
                  "formatted_address": "102 Lakeside Ave Seattle, WA 98122"
                },
                "categories": [
                  {"title": "Italian", "alias": "Italian"}
                ],
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
              },
              {
                "id": "faPVqws-x-5k2CQKDNtHxq",
                "name": "Southern Table",
                "price": "\$\$",
                "rating": 4.5,
                "photos": ["https://picsum.photos/250?image=9"],
                "location": {
                  "formatted_address": "102 Lakeside Ave Seattle, WA 98122"
                },
                "categories": [
                  {"title": "Italian", "alias": "Italian"}
                ],
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
      return Right(RestaurantQueryResult.fromJson(response['data']['search']));
    } catch (e) {
      return Left(GetRestaurantError(error: e.toString()));
    }
  }
}
