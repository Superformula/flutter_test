import 'package:restaurant_tour/data/models/restaurant.dart';

final fakeRestaurant = Restaurant.fromJson({
  "id": "vHz2RLtfUMVRPFmd7VBEHA",
  "name": "Gordon Ramsay Hell's Kitchen",
  "price": "\$\$\$",
  "rating": 4.4,
  "photos": [
    "https://s3-media2.fl.yelpcdn.com/bphoto/q771KjLzI5y638leJsnJnQ/o.jpg"
  ],
  "reviews": [
    {
      "id": "F88H5ow44AmiwisbrbswPw",
      "rating": 5,
      "text":
          "This entire experience is always so amazing. Every single dish is cooked to perfection. Every beef dish was so tender. The desserts were absolutely...",
      "user": {
        "id": "y742Fi1jF_JAqq5sRUlLEw",
        "image_url":
            "https://s3-media2.fl.yelpcdn.com/photo/rEWek1sYL0F35KZ0zRt3sw/o.jpg",
        "name": "Ashley L."
      }
    },
    {
      "id": "VJCoQlkk4Fjac0OPoRP8HQ",
      "rating": 5,
      "text":
          "Me and my husband came to celebrate my birthday here and it was a 10/10 experience. Firstly, I booked the wrong area which was the Gordon Ramsay pub and...",
      "user": {
        "id": "0bQNLf0POLTW4VhQZqOZoQ",
        "image_url":
            "https://s3-media3.fl.yelpcdn.com/photo/i_0K5RUOQnoIw1c4QzHmTg/o.jpg",
        "name": "Glydel L."
      }
    },
    {
      "id": "EeCKH7eUVDsZv0Ii9wcPiQ",
      "rating": 5,
      "text":
          "phenomenal! Bridgette made our experience as superb as the food coming to the table! would definitely come here again and try everything else on the menu,...",
      "user": {
        "id": "gL7AGuKBW4ne93_mR168pQ",
        "image_url":
            "https://s3-media1.fl.yelpcdn.com/photo/iU1sA7y3dEEc4iRL9LnWQQ/o.jpg",
        "name": "Sydney O."
      }
    }
  ],
  "categories": [
    {"title": "New American", "alias": "newamerican"},
    {"title": "Seafood", "alias": "seafood"}
  ],
  "hours": [
    {"is_open_now": true}
  ],
  "location": {
    "formatted_address": "3570 Las Vegas Blvd S\nLas Vegas, NV 89109"
  }
});

final fakeRestaurant2 = Restaurant.fromJson({
  "id": "faPVqws-x-5k2CQKDNtHxw",
  "name": "Yardbird",
  "price": "\$\$",
  "rating": 4.5,
  "photos": [
    "https://s3-media1.fl.yelpcdn.com/bphoto/xYJaanpF3Dl1OovhmpqAYw/o.jpg"
  ],
  "reviews": [
    {
      "id": "CN9oD1ncHKZtsGN7U1EMnA",
      "rating": 5,
      "text":
          "The food was delicious and the host and waitress were very nice, my husband and I really loved all the food, their cocktails are also amazing.",
      "user": {
        "id": "HArOfrshTW9s1HhN8oz8rg",
        "image_url":
            "https://s3-media3.fl.yelpcdn.com/photo/4sDrkYRIZxsXKCYdo9d1bQ/o.jpg",
        "name": "Snow7 C."
      }
    },
    {
      "id": "Qd-GV_v5gFHYO4VHw_6Dzw",
      "rating": 5,
      "text":
          "Their Chicken and waffles are the best! I thought it was too big for one person, you had better to share it with some people",
      "user": {
        "id": "ww0-zb-Nv5ccWd1Vbdmo-A",
        "image_url":
            "https://s3-media4.fl.yelpcdn.com/photo/g-9Uqpy-lNszg0EXTuqwzQ/o.jpg",
        "name": "Eri O."
      }
    },
    {
      "id": "cqMrOWT9kRQOt3VUqOUbHg",
      "rating": 5,
      "text":
          "Our last meal in Vegas was amazing at Yardbird. We have been to the Yardbird in Chicago so we thought we knew what to expect; however, we were blown away by...",
      "user": {
        "id": "10oig4nwHnOAnAApdYvNrg",
        "image_url": null,
        "name": "Ellie K."
      }
    }
  ],
  "categories": [
    {"title": "Southern", "alias": "southern"},
    {"title": "New American", "alias": "newamerican"},
    {"title": "Cocktail Bars", "alias": "cocktailbars"}
  ],
  "hours": [
    {"is_open_now": true}
  ],
  "location": {
    "formatted_address": "3355 Las Vegas Blvd S\nLas Vegas, NV 89109"
  }
});
