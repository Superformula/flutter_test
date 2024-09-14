import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';

class RestaurantFake extends RestaurantGateway {
  @override
  Future<Restaurant?> getRestaurant(String id) {
    return Future.value(
      Restaurant(
        id: '',
        name: '',
        price: '',
        rating: 5,
        categories: [],
        hours: [],
        location: Location(),
        photos: [],
        reviews: [],
      ),
    );
  }

  @override
  Future<List<Restaurant>?> getRestaurants({int offset = 0}) {
    return Future.value([
      Restaurant.fromJson(
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
              "text":
                  "Returned to celebrate our 20th Wedding Anniversary and was best ever!  Anthony F. is exceptional! His energy amazing and recommendations on the ale's is...",
              "user": {"id": "VHG6QeWwufacGY0M1ohJ3A", "image_url": null, "name": "Cheryl K."},
            },
            {
              "id": "n5R8ulxap3NlVvFI9Jpt7g",
              "rating": 5,
              "text":
                  "Amazing food. Super yummy drinks. Great deals. All around great place to bring yourself, your family, and your doggies!! Always get excellent service....",
              "user": {"id": "mpHWQc0QfftpIJ8BK9pQlQ", "image_url": null, "name": "Michelle N."},
            },
            {
              "id": "-725DOCli9uaE4AmByHwLA",
              "rating": 5,
              "text":
                  "Absolutely amazing desert! The food was super good too! Alexia and Ursula were wonderful and super kind and responsive! Great staff and a very nice manager!...",
              "user": {"id": "eUhgwQHJN1h1_JkNrfPN4w", "image_url": null, "name": "Alex B."},
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
        },
      ),
    ]);
  }
}
