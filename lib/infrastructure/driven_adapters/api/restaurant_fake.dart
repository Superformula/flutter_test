import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant_data_to_restaurants.dart';

class RestaurantFake extends RestaurantGateway {
  @override
  Future<RestaurantEntity?> getRestaurant(String id) {
    final restaurantJson = {
      "id": "rdE9gg0WB7Z8kRytIMSapg",
      "name": "Lazy Dog Restaurant & Bar",
      "price": "\$\$",
      "rating": 4.5,
      "photos": ["https://s3-media2.fl.yelpcdn.com/bphoto/_Wz-fNXawmbBinSf9Ev15g/o.jpg"],
      "reviews": [
        {
          "id": "la_qZrx85d4b3WkeWBdbJA",
          "rating": 5,
          "text": "Returned to celebrate our 20th Wedding Anniversary and was best ever! Anthony F. is exceptional!",
          "user": {"id": "VHG6QeWwufacGY0M1ohJ3A", "image_url": null, "name": "Cheryl K."},
        }
      ],
      "categories": [
        {"title": "New American", "alias": "newamerican"},
        {"title": "Comfort Food", "alias": "comfortfood"},
        {"title": "Burgers", "alias": "burgers"},
      ],
      "hours": [
        {"is_open_now": true},
      ],
      "location": {
        "formatted_address": "6509 S Las Vegas Blvd\nLas Vegas, NV 89119",
      },
    };
    final restaurantInfra = Restaurant.fromJson(restaurantJson);
    final restaurantEntity = RestaurantMapper.fromInfrastructure(restaurantInfra);

    return Future.value(restaurantEntity);
  }

  @override
  Future<List<RestaurantEntity>?> getRestaurants({int offset = 0}) {
    final restaurantsJson = [
      {
        "id": "rdE9gg0WB7Z8kRytIMSapg",
        "name": "Lazy Dog Restaurant & Bar",
        "price": "\$\$",
        "rating": 4.5,
        "photos": ["https://s3-media2.fl.yelpcdn.com/bphoto/_Wz-fNXawmbBinSf9Ev15g/o.jpg"],
        "reviews": [
          {
            "id": "la_qZrx85d4b3WkeWBdbJA",
            "rating": 5,
            "text": "Returned to celebrate our 20th Wedding Anniversary and was best ever! Anthony F. is exceptional!",
            "user": {"id": "VHG6QeWwufacGY0M1ohJ3A", "image_url": null, "name": "Cheryl K."},
          }
        ],
        "categories": [
          {"title": "New American", "alias": "newamerican"},
          {"title": "Comfort Food", "alias": "comfortfood"},
          {"title": "Burgers", "alias": "burgers"},
        ],
        "hours": [
          {"is_open_now": true},
        ],
        "location": {
          "formatted_address": "6509 S Las Vegas Blvd\nLas Vegas, NV 89119",
        },
      }
    ];
    final restaurantEntities =
        restaurantsJson.map((json) => RestaurantMapper.fromInfrastructure(Restaurant.fromJson(json))).toList();

    return Future.value(restaurantEntities);
  }
}
// import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
// import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';

// class RestaurantFake extends RestaurantGateway {
//   @override
//   Future<RestaurantEntity?> getRestaurant(String id) {
//     // Simula la respuesta de un solo restaurante
//     return Future.value(
//       RestaurantEntity(
//         id: 'rdE9gg0WB7Z8kRytIMSapg',
//         name: 'Lazy Dog Restaurant & Bar',
//         price: '\$\$',
//         rating: 4.5,
//         categories: [
//           Category(title: 'New American'),
//           Category(title: 'Comfort Food'),
//           Category(title: 'Burgers'),
//         ],
//         hours: [
//           Hours(isOpenNow: true),
//         ],
//         location: Location(formattedAddress: '6509 S Las Vegas Blvd\nLas Vegas, NV 89119'),
//         photos: ['https://s3-media2.fl.yelpcdn.com/bphoto/_Wz-fNXawmbBinSf9Ev15g/o.jpg'],
//         reviews: [
//           Review(
//             id: 'la_qZrx85d4b3WkeWBdbJA',
//             rating: 5,
//             text:
//                 'Returned to celebrate our 20th Wedding Anniversary and was best ever! Anthony F. is exceptional!',
//             user: User(id: 'VHG6QeWwufacGY0M1ohJ3A', imageUrl: null, name: 'Cheryl K.'),
//           ),
//           Review(
//             id: 'n5R8ulxap3NlVvFI9Jpt7g',
//             rating: 5,
//             text:
//                 'Amazing food. Super yummy drinks. Great deals. All around great place to bring your doggies!',
//             user: User(id: 'mpHWQc0QfftpIJ8BK9pQlQ', imageUrl: null, name: 'Michelle N.'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Future<List<RestaurantEntity>?> getRestaurants({int offset = 0}) {
//     // Simula la respuesta de una lista de restaurantes
//     return Future.value([
//       RestaurantEntity(
//         id: 'rdE9gg0WB7Z8kRytIMSapg',
//         name: 'Lazy Dog Restaurant & Bar',
//         price: '\$\$',
//         rating: 4.5,
//         categories: [
//           Category(title: 'New American'),
//           Category(title: 'Comfort Food'),
//           Category(title: 'Burgers'),
//         ],
//         hours: [
//           Hours(isOpenNow: true),
//         ],
//         location: Location(formattedAddress: '6509 S Las Vegas Blvd\nLas Vegas, NV 89119'),
//         photos: ['https://s3-media2.fl.yelpcdn.com/bphoto/_Wz-fNXawmbBinSf9Ev15g/o.jpg'],
//         reviews: [
//           Review(
//             id: 'la_qZrx85d4b3WkeWBdbJA',
//             rating: 5,
//             text:
//                 'Returned to celebrate our 20th Wedding Anniversary and was best ever! Anthony F. is exceptional!',
//             user: User(id: 'VHG6QeWwufacGY0M1ohJ3A', imageUrl: null, name: 'Cheryl K.'),
//           ),
//           Review(
//             id: 'n5R8ulxap3NlVvFI9Jpt7g',
//             rating: 5,
//             text:
//                 'Amazing food. Super yummy drinks. Great deals. All around great place to bring your doggies!',
//             user: User(id: 'mpHWQc0QfftpIJ8BK9pQlQ', imageUrl: null, name: 'Michelle N.'),
//           ),
//         ],
//       ),
//     ]);
//   }
// }
