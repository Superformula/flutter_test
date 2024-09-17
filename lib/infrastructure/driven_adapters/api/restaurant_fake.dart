// coverage:ignore-file
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
        "id": "vHz2RLtfUMVRPFmd7VBEHA",
        "name": "Gordon Ramsay Hell's Kitchen",
        "price": "\$\$",
        "rating": 4.4,
        "photos": [
          "https://s3-media2.fl.yelpcdn.com/bphoto/q771KjLzI5y638leJsnJnQ/o.jpg",
        ],
        "reviews": [
          {
            "id": "F88H5ow44AmiwisbrbswPw",
            "rating": 5,
            "text":
                "This entire experience is always so amazing. Every single dish is cooked to perfection. Every beef dish was so tender. The desserts were absolutely...",
            "user": {
              "id": "y742Fi1jF_JAqq5sRUlLEw",
              "image_url": "https://s3-media2.fl.yelpcdn.com/photo/rEWek1sYL0F35KZ0zRt3sw/o.jpg",
              "name": "Ashley L.",
            },
          },
          {
            "id": "VJCoQlkk4Fjac0OPoRP8HQ",
            "rating": 5,
            "text":
                "Me and my husband came to celebrate my birthday here and it was a 10/10 experience. Firstly, I booked the wrong area which was the Gordon Ramsay pub and...",
            "user": {
              "id": "0bQNLf0POLTW4VhQZqOZoQ",
              "image_url": "https://s3-media3.fl.yelpcdn.com/photo/i_0K5RUOQnoIw1c4QzHmTg/o.jpg",
              "name": "Glydel L.",
            },
          },
          {
            "id": "EeCKH7eUVDsZv0Ii9wcPiQ",
            "rating": 5,
            "text":
                "phenomenal! Bridgette made our experience as superb as the food coming to the table! would definitely come here again and try everything else on the menu,...",
            "user": {
              "id": "gL7AGuKBW4ne93_mR168pQ",
              "image_url": "https://s3-media1.fl.yelpcdn.com/photo/iU1sA7y3dEEc4iRL9LnWQQ/o.jpg",
              "name": "Sydney O.",
            },
          }
        ],
        "categories": [
          {
            "title": "New American",
            "alias": "newamerican",
          },
          {
            "title": "Seafood",
            "alias": "seafood",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "3570 Las Vegas Blvd S\nLas Vegas, NV 89109",
        },
      },
      {
        "id": "faPVqws-x-5k2CQKDNtHxw",
        "name": "Yardbird",
        "price": "\$\$",
        "rating": 4.5,
        "photos": [
          "https://s3-media1.fl.yelpcdn.com/bphoto/xYJaanpF3Dl1OovhmpqAYw/o.jpg",
        ],
        "reviews": [
          {
            "id": "CN9oD1ncHKZtsGN7U1EMnA",
            "rating": 5,
            "text":
                "The food was delicious and the host and waitress were very nice, my husband and I really loved all the food, their cocktails are also amazing.",
            "user": {
              "id": "HArOfrshTW9s1HhN8oz8rg",
              "image_url": "https://s3-media3.fl.yelpcdn.com/photo/4sDrkYRIZxsXKCYdo9d1bQ/o.jpg",
              "name": "Snow7 C.",
            },
          },
          {
            "id": "Qd-GV_v5gFHYO4VHw_6Dzw",
            "rating": 5,
            "text":
                "Their Chicken and waffles are the best! I thought it was too big for one person, you had better to share it with some people",
            "user": {
              "id": "ww0-zb-Nv5ccWd1Vbdmo-A",
              "image_url": "https://s3-media4.fl.yelpcdn.com/photo/g-9Uqpy-lNszg0EXTuqwzQ/o.jpg",
              "name": "Eri O.",
            },
          },
          {
            "id": "cqMrOWT9kRQOt3VUqOUbHg",
            "rating": 5,
            "text":
                "Our last meal in Vegas was amazing at Yardbird. We have been to the Yardbird in Chicago so we thought we knew what to expect; however, we were blown away by...",
            "user": {
              "id": "10oig4nwHnOAnAApdYvNrg",
              "image_url": null,
              "name": "Ellie K.",
            },
          }
        ],
        "categories": [
          {
            "title": "Southern",
            "alias": "southern",
          },
          {
            "title": "New American",
            "alias": "newamerican",
          },
          {
            "title": "Cocktail Bars",
            "alias": "cocktailbars",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "3355 Las Vegas Blvd S\nLas Vegas, NV 89109",
        },
      },
      {
        "id": "QXV3L_QFGj8r6nWX2kS2hA",
        "name": "Nacho Daddy",
        "price": "\$\$",
        "rating": 4.4,
        "photos": [
          "https://s3-media4.fl.yelpcdn.com/bphoto/pu9doqMplB5x5SEs8ikW6w/o.jpg",
        ],
        "reviews": [
          {
            "id": "ZUmf3YPOAfJFmNxZ0G2sAA",
            "rating": 5,
            "text":
                "First - the service is incredible here. But the food is out of this world! Not to mention the margs - You will not leave disappointed.",
            "user": {
              "id": "J0MRFwpKN06MCOj9vv78dQ",
              "image_url": "https://s3-media2.fl.yelpcdn.com/photo/YZpS54TUdmdcok38lZAI_Q/o.jpg",
              "name": "Chris A.",
            },
          },
          {
            "id": "hBgZYMYRptmOiEur5gwMYA",
            "rating": 5,
            "text":
                "The food here is very good. I enjoyed the atmosphere as well. My server Daisy was very attentive and personable.",
            "user": {
              "id": "nz3l8hjtsnbrp1xcN8zk4Q",
              "image_url": null,
              "name": "Joe B.",
            },
          },
          {
            "id": "ksJ6G7Jwq9x6J-st2Z-ynw",
            "rating": 5,
            "text":
                "Service was so fast and friendly! The nachos are truly good and kept hot by flame!  Highly recommend!",
            "user": {
              "id": "ZyJIBp75lHEa4Ve-J-I1Bg",
              "image_url": null,
              "name": "Sadie G.",
            },
          }
        ],
        "categories": [
          {
            "title": "New American",
            "alias": "newamerican",
          },
          {
            "title": "Mexican",
            "alias": "mexican",
          },
          {
            "title": "Breakfast & Brunch",
            "alias": "breakfast_brunch",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "3663 Las Vegas Blvd\nSte 595\nLas Vegas, NV 89109",
        },
      },
      {
        "id": "syhA1ugJpyNLaB0MiP19VA",
        "name": "888 Japanese BBQ",
        "price": "\$\$\$",
        "rating": 4.8,
        "photos": [
          "https://s3-media1.fl.yelpcdn.com/bphoto/V_zmwCUG1o_vR29xfkb-ng/o.jpg",
        ],
        "reviews": [
          {
            "id": "S7ftRkufT8eOlmW1jpgH0A",
            "rating": 5,
            "text":
                "The GOAT of Kbbq in Vegas!\nCoz yelp wanted me to type more than 85 characters so dont mind this...gnsgngenv gebg dhngdngbscgejegjfjegnfsneybgssybgsbye",
            "user": {
              "id": "MYfJmm9I5u1jsMg9JearYg",
              "image_url": null,
              "name": "Leonard L.",
            },
          },
          {
            "id": "wFIuXMZFCrGhx6iQIW1fxg",
            "rating": 5,
            "text":
                "Fantastic meet selection!  Great quality of food! Definitely come back soon! The cobe beef is melting in your mouth",
            "user": {
              "id": "4Wx67UxwYv3YshUQTPAgfA",
              "image_url": null,
              "name": "Gongliang Y.",
            },
          },
          {
            "id": "uTH-r_iOB03pfN-8vI9q2w",
            "rating": 5,
            "text":
                "The line looked huge but we were seated in a timely manner and the food was delicious! Server was very patient and the food was delivered often and fresh! I...",
            "user": {
              "id": "_ossdCovKvLNJvvH0XbPrQ",
              "image_url": null,
              "name": "Jack M.",
            },
          }
        ],
        "categories": [
          {
            "title": "Barbeque",
            "alias": "bbq",
          },
          {
            "title": "Japanese",
            "alias": "japanese",
          }
        ],
        "hours": [
          {
            "is_open_now": false,
          }
        ],
        "location": {
          "formatted_address": "3550 S Decatur Blvd\nLas Vegas, NV 89103",
        },
      },
      {
        "id": "rdE9gg0WB7Z8kRytIMSapg",
        "name": "Lazy Dog Restaurant & Bar",
        "price": "\$\$",
        "rating": 4.5,
        "photos": [
          "https://s3-media2.fl.yelpcdn.com/bphoto/_Wz-fNXawmbBinSf9Ev15g/o.jpg",
        ],
        "reviews": [
          {
            "id": "la_qZrx85d4b3WkeWBdbJA",
            "rating": 5,
            "text":
                "Returned to celebrate our 20th Wedding Anniversary and was best ever!  Anthony F. is exceptional! His energy amazing and recommendations on the ale's is...",
            "user": {
              "id": "VHG6QeWwufacGY0M1ohJ3A",
              "image_url": null,
              "name": "Cheryl K.",
            },
          },
          {
            "id": "n5R8ulxap3NlVvFI9Jpt7g",
            "rating": 5,
            "text":
                "Amazing food. Super yummy drinks. Great deals. All around great place to bring yourself, your family, and your doggies!! Always get excellent service....",
            "user": {
              "id": "mpHWQc0QfftpIJ8BK9pQlQ",
              "image_url": null,
              "name": "Michelle N.",
            },
          },
          {
            "id": "-725DOCli9uaE4AmByHwLA",
            "rating": 5,
            "text":
                "Absolutely amazing desert! The food was super good too! Alexia and Ursula were wonderful and super kind and responsive! Great staff and a very nice manager!...",
            "user": {
              "id": "eUhgwQHJN1h1_JkNrfPN4w",
              "image_url": null,
              "name": "Alex B.",
            },
          }
        ],
        "categories": [
          {
            "title": "New American",
            "alias": "newamerican",
          },
          {
            "title": "Comfort Food",
            "alias": "comfortfood",
          },
          {
            "title": "Burgers",
            "alias": "burgers",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "6509 S Las Vegas Blvd\nLas Vegas, NV 89119",
        },
      },
      {
        "id": "JPfi__QJAaRzmfh5aOyFEw",
        "name": "Shang Artisan Noodle - Flamingo Road",
        "price": "\$\$",
        "rating": 4.6,
        "photos": [
          "https://s3-media3.fl.yelpcdn.com/bphoto/TqV2TDWH-7Wje5B9Oh1EZw/o.jpg",
        ],
        "reviews": [
          {
            "id": "GcGUAH0FPeyfw7rw7eu2Sg",
            "rating": 5,
            "text":
                "Best beef noodle soup I've ever had. Portion sizes huge. Family of 5 could have shared 3 bowls with some appetizers. Spicy wonton and beef dumplings were...",
            "user": {
              "id": "4H2AFePQc7B4LGWhGkAb2g",
              "image_url": null,
              "name": "AA K.",
            },
          },
          {
            "id": "5PIdVMRd-3OngPsOmvDIpg",
            "rating": 5,
            "text":
                "What We Ordered:\n\n-Chicken Chow Mein (Hand Pulled) \$14.97\n-Pork Rib Noodle (Hand Pulled) \$14.97\n-Spicy Beef Noodle (Sauce on Side) (Hand Pulled)...",
            "user": {
              "id": "hYHkr9DBesvZfDrLn5n69g",
              "image_url": "https://s3-media4.fl.yelpcdn.com/photo/UfFnm-1ZxCuxOSJpTWHzRg/o.jpg",
              "name": "Erik G.",
            },
          },
          {
            "id": "ywLEEbAoQxnnBmx6PfjyRQ",
            "rating": 5,
            "text":
                "i always have to come here when i visit vegas and i'm always left satisfied! Their portion sizes are amazing and food came to us super quick! \n\nI got the...",
            "user": {
              "id": "wy37YyKD1pnLdxT8m8DvnQ",
              "image_url": "https://s3-media2.fl.yelpcdn.com/photo/XESSmJx2Wt8F1na9op6aHg/o.jpg",
              "name": "Chenghui W.",
            },
          }
        ],
        "categories": [
          {
            "title": "Noodles",
            "alias": "noodles",
          },
          {
            "title": "Chinese",
            "alias": "chinese",
          },
          {
            "title": "Soup",
            "alias": "soup",
          },
        ],
        "hours": [
          {
            "is_open_now": true,
          },
        ],
        "location": {
          "formatted_address": "4983 W Flamingo Rd\nSte B\nLas Vegas, NV 89103",
        },
      },
      {
        "id": "gOOfBSBZlffCkQ7dr7cpdw",
        "name": "CHICA",
        "price": "\$\$",
        "rating": 4.3,
        "photos": [
          "https://s3-media2.fl.yelpcdn.com/bphoto/FxmtjuzPDiL7vx5KyceWuQ/o.jpg",
        ],
        "reviews": [
          {
            "id": "k0mR3x34X9bXMZfyTsO8nQ",
            "rating": 5,
            "text":
                "The food was amazing. I had the Latin breakfast. Our table shared the donuts...delicious. We had drinks and they were made with fresh ingredients. They...",
            "user": {
              "id": "47SO7vTL6Louu9Gbkq8UeA",
              "image_url": null,
              "name": "Brandi T.",
            },
          },
          {
            "id": "rGQO2YvGdAhRLp4dEndGTg",
            "rating": 5,
            "text":
                "I found this restaurant while doing an extensive search of great seafood, grilled octopus and a nice environment. Let me just say this did NOT...",
            "user": {
              "id": "0wFQH6qZAKaw00ByDmhHdQ",
              "image_url": "https://s3-media2.fl.yelpcdn.com/photo/U4fbhriK5hDxZnN2z_Nr0Q/o.jpg",
              "name": "Delicia B.",
            },
          },
          {
            "id": "TuKLZav5Fce2iRZtB-K54A",
            "rating": 5,
            "text":
                "Edgar was amazing and extremely helpful.   The food was delicious, this is our last day, I wish I knew about this spot 3 days ago, I would've made several...",
            "user": {
              "id": "TVQ6klO7KNxnGQStZinu6A",
              "image_url": "https://s3-media2.fl.yelpcdn.com/photo/8sE_Headyqi9PA7Tbn5Mng/o.jpg",
              "name": "Kieva S.",
            },
          }
        ],
        "categories": [
          {
            "title": "Latin American",
            "alias": "latin",
          },
          {
            "title": "Breakfast & Brunch",
            "alias": "breakfast_brunch",
          },
          {
            "title": "Cocktail Bars",
            "alias": "cocktailbars",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "3355 South Las Vegas Blvd\nSte 106\nLas Vegas, NV 89109",
        },
      },
      {
        "id": "3kdSl5mo9dWC4clrQjEDGg",
        "name": "Egg & I",
        "price": "\$\$",
        "rating": 4.5,
        "photos": [
          "https://s3-media1.fl.yelpcdn.com/bphoto/z4rdxoc6xaM4dmdPovPBDg/o.jpg",
        ],
        "reviews": [
          {
            "id": "UJEQG8N-FC0Hc8G9Bdh5QQ",
            "rating": 5,
            "text":
                "Huge servings. Waiters are nice and service is quick! Food is delicious. Banana muffins are a must have!",
            "user": {
              "id": "mKHzEUlshby64kREjoHIzA",
              "image_url": null,
              "name": "Fauve P.",
            },
          },
          {
            "id": "P6yj97cmXiHzXJV3B0L7xA",
            "rating": 5,
            "text":
                "The food was delicious and just how i ordered it. I had the chicken sandwich with fries. Our waitress was Crystal,  even though it was only her fourth day...",
            "user": {
              "id": "SxuhAYL2h6441S51H9tlmQ",
              "image_url": null,
              "name": "Bhlasian G.",
            },
          },
          {
            "id": "ZKtZnI-a-ulWzIBYTgl7wg",
            "rating": 5,
            "text":
                "the food was fantastic! service was fast and polite. they have such a cute train inside and the menu has so many options!",
            "user": {
              "id": "iyaxl9fZySkfRthWTZwn-w",
              "image_url": null,
              "name": "Shylene S.",
            },
          }
        ],
        "categories": [
          {
            "title": "Breakfast & Brunch",
            "alias": "breakfast_brunch",
          },
          {
            "title": "Burgers",
            "alias": "burgers",
          },
          {
            "title": "American",
            "alias": "tradamerican",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "4533 W Sahara Ave\nSte 5\nLas Vegas, NV 89102",
        },
      },
      {
        "id": "2iTsRqUsPGRH1li1WVRvKQ",
        "name": "Carson Kitchen",
        "price": "\$\$",
        "rating": 4.5,
        "photos": [
          "https://s3-media2.fl.yelpcdn.com/bphoto/LhaPvLHIrsHu8ZMLgV04OQ/o.jpg",
        ],
        "reviews": [
          {
            "id": "PzKQYLK6skSfAUP73P8YXQ",
            "rating": 5,
            "text":
                "Our son gave his mother a birthday gift of a meal at Carson Kitchen. He's the kind of guy that does thorough reviews on everything he's interested in...",
            "user": {
              "id": "Cvlm-uNVOY2i5zPWQdLupA",
              "image_url": "https://s3-media3.fl.yelpcdn.com/photo/ZT4s2popID75p_yJbo1xjg/o.jpg",
              "name": "Bill H.",
            },
          },
          {
            "id": "pq6VEb97OpbB-KwvsJVyfw",
            "rating": 4,
            "text":
                "Came here during my most recent Vegas trip and was intrigued by the menu options! There's a parking lot close by (pay by the booth) but since I came on a...",
            "user": {
              "id": "TMeT1a_1MJLOYobdY6Bs-A",
              "image_url": "https://s3-media2.fl.yelpcdn.com/photo/CxCo55gIOATctXc5wLa5CQ/o.jpg",
              "name": "Amy E.",
            },
          },
          {
            "id": "5LF6EKorAR01mWStVYmYBw",
            "rating": 4,
            "text":
                "The service and the atmosphere were amazing! Our server was very knowledgeable about the menu and helped guide our selections. We tired five different...",
            "user": {
              "id": "a71YY9h3GRv7F-4_OGGiRQ",
              "image_url": "https://s3-media1.fl.yelpcdn.com/photo/3EDvhfkljrLyodxSrn8Fqg/o.jpg",
              "name": "May G.",
            },
          }
        ],
        "categories": [
          {
            "title": "New American",
            "alias": "newamerican",
          },
          {
            "title": "Desserts",
            "alias": "desserts",
          },
          {
            "title": "Cocktail Bars",
            "alias": "cocktailbars",
          }
        ],
        "hours": [
          {
            "is_open_now": false,
          }
        ],
        "location": {
          "formatted_address": "124 S 6th St\nSte 100\nLas Vegas, NV 89101",
        },
      },
      {
        "id": "igHYkXZMLAc9UdV5VnR_AA",
        "name": "Echo & Rig",
        "price": "\$\$\$",
        "rating": 4.4,
        "photos": [
          "https://s3-media1.fl.yelpcdn.com/bphoto/Q9swks1BO-w-hVskIHrCVg/o.jpg",
        ],
        "reviews": [
          {
            "id": "vbEuCit3l5lLrMkxEoaPNg",
            "rating": 4,
            "text":
                "I've been a regular at Echo & Rig for some time, and it's always been a pleasant experience--until our visit this evening. From the moment we walked in, we...",
            "user": {
              "id": "e9Mwwtzm7X5kiM7RcJRmsg",
              "image_url": null,
              "name": "Stacie E.",
            },
          },
          {
            "id": "uYrXHV5g1itgn_yBuBoDyQ",
            "rating": 5,
            "text":
                "We haven't been here in a while, but this place never disappoints. We came here for my Mom's birthday and had a reservation. We sat outside on the patio...",
            "user": {
              "id": "H_KCkMeFblrh_owAYU9GmQ",
              "image_url": "https://s3-media1.fl.yelpcdn.com/photo/CAFp2hKUCcrpUZ47dZJxtA/o.jpg",
              "name": "Marissa L.",
            },
          },
          {
            "id": "ToLyAnrJ55aD_DJfFyFouQ",
            "rating": 4,
            "text":
                "Well, a very busy restaurant the staff were very attentive to everyone.in our party of 10.  All meals were delicious! 4  different steaks, all cooked...",
            "user": {
              "id": "rHxbiOPq-zLI9VaG2Ai8NA",
              "image_url": "https://s3-media1.fl.yelpcdn.com/photo/Iy8so1sFgW_m-6nHngw_DA/o.jpg",
              "name": "WB D.",
            },
          }
        ],
        "categories": [
          {
            "title": "Steakhouses",
            "alias": "steak",
          },
          {
            "title": "Butcher",
            "alias": "butcher",
          },
          {
            "title": "Tapas/Small Plates",
            "alias": "tapasmallplates",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "440 S Rampart Blvd\nLas Vegas, NV 89145",
        },
      },
      {
        "id": "QCCVxVRt1amqv0AaEWSKkg",
        "name": "Esther's Kitchen",
        "price": "\$\$",
        "rating": 4.5,
        "photos": [
          "https://s3-media3.fl.yelpcdn.com/bphoto/uk6-4u8H6BpxaJAKDEzFOA/o.jpg",
        ],
        "reviews": [
          {
            "id": "exJ7J1xtJgfYX8wKnOJb7g",
            "rating": 5,
            "text":
                "Sat at the bar, place was jumping at lunch time, spotting the whos who of Vegas, Friendly staff with amazing food and service. Cant wait to get back there...",
            "user": {
              "id": "fJuUotyAX1KtJ7yXmfwzXA",
              "image_url": null,
              "name": "Barry D.",
            },
          },
          {
            "id": "VjmUIlp_Y0_0ISEjqZvKAw",
            "rating": 5,
            "text":
                "Our server Josh was AMAZING! He was so attentive and sweet  I've been to their on location and the new one does not disappoint. I tried something new...",
            "user": {
              "id": "59qcS7L8sHAaxziIg4_i5A",
              "image_url": null,
              "name": "Caitlin S.",
            },
          },
          {
            "id": "fYGyOGLuDQcZJva0tHjdxQ",
            "rating": 5,
            "text":
                "Esther's Kitchen\n\nWe had a wonderful lunch experience! Rocco was our waiter, and he was exceptional--so friendly, talkative, and made us feel right at home....",
            "user": {
              "id": "jsH3aUC_UuFYv5etKNNgLQ",
              "image_url": "https://s3-media3.fl.yelpcdn.com/photo/zG63zZ6Bx8M47sanNzUTUg/o.jpg",
              "name": "S M.",
            },
          }
        ],
        "categories": [
          {
            "title": "Italian",
            "alias": "italian",
          },
          {
            "title": "Pizza",
            "alias": "pizza",
          },
          {
            "title": "Cocktail Bars",
            "alias": "cocktailbars",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "1131 S Main St\nLas Vegas, NV 89104",
        },
      },
      {
        "id": "SVGApDPNdpFlEjwRQThCxA",
        "name": "Juan's Flaming Fajitas & Cantina - Tropicana",
        "price": "\$\$",
        "rating": 4.6,
        "photos": [
          "https://s3-media3.fl.yelpcdn.com/bphoto/a8L9bQZ2XW8etXLomKKdDw/o.jpg",
        ],
        "reviews": [
          {
            "id": "OhNNxqDs-u01FgD2lDo3bg",
            "rating": 5,
            "text": "Great food! Amazing service would definitely come back again. Server Valentin was awesome..",
            "user": {
              "id": "_afUkXzAKFmL7k78H7CQkQ",
              "image_url": null,
              "name": "Jo G.",
            },
          },
          {
            "id": "QrqQBcKENE83z4sWBdQyrg",
            "rating": 5,
            "text":
                "My FAVORITE Mexican food in Vegas!! From the service to the food I'd give 5 stars all around!!! Everyone is always friendly and welcoming!!! \n\nI can't ever...",
            "user": {
              "id": "YvEyOqT0PUyFwZ9NUj_A0A",
              "image_url": "https://s3-media4.fl.yelpcdn.com/photo/kra2v9Z6sd7W9S1enUDJrA/o.jpg",
              "name": "Christy G.",
            },
          },
          {
            "id": "_m_7QpxiUMGWniUdxYR39Q",
            "rating": 4,
            "text":
                "Been here a couple of times now, and the service and food here is very good. The place is always busy, so be sure to make a reservation. \nWe got the pork...",
            "user": {
              "id": "Rg2J4V438Tmpl5W317D3oQ",
              "image_url": "https://s3-media2.fl.yelpcdn.com/photo/6V_8yLDPkBNG8nwzREbXpw/o.jpg",
              "name": "Francine H.",
            },
          }
        ],
        "categories": [
          {
            "title": "Mexican",
            "alias": "mexican",
          },
          {
            "title": "Breakfast & Brunch",
            "alias": "breakfast_brunch",
          },
          {
            "title": "Cocktail Bars",
            "alias": "cocktailbars",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "9640 W Tropicana\nSte 101\nLas Vegas, NV 89147",
        },
      },
      {
        "id": "4JNXUYY8wbaaDmk3BPzlWw",
        "name": "Mon Ami Gabi",
        "price": "\$\$\$",
        "rating": 4.2,
        "photos": [
          "https://s3-media3.fl.yelpcdn.com/bphoto/FFhN_E1rV0txRVa6elzcZw/o.jpg",
        ],
        "reviews": [
          {
            "id": "rAHgAhEdG0xoQspXc_6sZw",
            "rating": 4,
            "text":
                "Great food and great atmosphere but I still feel that everything here in Vegas has gotten out of control with the pricing. Two salads and a pasta plate with...",
            "user": {
              "id": "EE1M_Gq7uwGQhDb_v1POQQ",
              "image_url": null,
              "name": "Bert K.",
            },
          },
          {
            "id": "baBnM1ontpOLgoeu2xv6Wg",
            "rating": 5,
            "text":
                "the breakfast was amazing, possibly the best french toast i've ever eaten. i'd love to try more items in the future, super appetizing. ate an entire french...",
            "user": {
              "id": "xSvgz_-dtVa_GINcR85wzA",
              "image_url": null,
              "name": "Lilly H.",
            },
          },
          {
            "id": "Y26nTAgVICnoWFYXv6WADQ",
            "rating": 5,
            "text":
                "Mon Ami Gabi is a must-visit when in Las Vegas.\n\nThe ambiance is beautiful, with gorgeous décor and outdoor seating that offers a lovely view of the Strip...",
            "user": {
              "id": "A2dHesqWIIUIwRjXfzxnoQ",
              "image_url": "https://s3-media1.fl.yelpcdn.com/photo/WCdlBRwgRdY5NKdAk2tFJQ/o.jpg",
              "name": "Tori T.",
            },
          }
        ],
        "categories": [
          {
            "title": "French",
            "alias": "french",
          },
          {
            "title": "Steakhouses",
            "alias": "steak",
          },
          {
            "title": "Breakfast & Brunch",
            "alias": "breakfast_brunch",
          }
        ],
        "hours": [
          {
            "is_open_now": true,
          }
        ],
        "location": {
          "formatted_address": "3655 Las Vegas Blvd S\nLas Vegas, NV 89109",
        },
      },
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
