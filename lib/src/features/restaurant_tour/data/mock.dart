import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

List<Restaurant> mockRestaurants = [
  Restaurant(
    id: '1',
    name: 'Pasta Paradise',
    price: '\$\$',
    rating: 4.5,
    photos: [
      'https://i.pinimg.com/originals/b5/90/a7/b590a70a53f5712d4abfd6bf938d054d.jpg',
      'https://www.metacritic.com/a/img/catalog/provider/6/12/6-1-764252-52.jpg',
    ],
    categories: [
      Category(alias: 'italian', title: 'Italian'),
    ],
    hours: [
      const Hours(isOpenNow: true),
    ],
    reviews: [
      const Review(
        id: 'r1',
        rating: 5,
        text:
            'Amazing food! Highly recommended. Amazing food! Highly recommended.',
        user: User(
          id: 'u1',
          imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
          name: 'John Doe',
        ),
      ),
      const Review(
        id: 'r2',
        rating: 2,
        text:
            'Review text goes there. Review text goes here. This is a review. This is a review that is 3 lines long.',
        user: User(
          id: 'u1',
          imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
          name: 'John Test',
        ),
      ),
    ],
    location: Location(
      formattedAddress: '123 Pasta Lane, Food City, FC 12345',
    ),
  ),
  Restaurant(
    id: '2',
    name: 'Burger Bonanza',
    price: '\$\$',
    rating: 4.0,
    photos: [
      'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2022/07/marvels-avengers-2748987.jpg',
      'https://images.unsplash.com/photo-1567439204-e8a1c3c1ea80',
    ],
    categories: [
      Category(alias: 'american', title: 'American'),
    ],
    hours: [
      const Hours(isOpenNow: false),
    ],
    reviews: [
      const Review(
        id: 'r2',
        rating: 4,
        text: 'Great burgers but a bit expensive.',
        user: User(
          id: 'u2',
          imageUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
          name: 'Jane Smith',
        ),
      ),
    ],
    location: Location(
      formattedAddress: '456 Burger Blvd, Meat Town, MT 67890',
    ),
  ),
  Restaurant(
    id: '3',
    name: 'Sushi World',
    price: '\$\$\$',
    rating: 4.8,
    photos: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqQrl5EGU85_IW-T1FQcfTexUPr8htRkBzIw&s',
      'https://images.unsplash.com/photo-1534503829050-1c8b38c9d137',
    ],
    categories: [
      Category(alias: 'japanese', title: 'Japanese'),
    ],
    hours: [
      const Hours(isOpenNow: true),
    ],
    reviews: [
      const Review(
        id: 'r3',
        rating: 5,
        text: 'Best sushi in town. Fresh and delicious!',
        user: User(
          id: 'u3',
          imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
          name: 'Alice Cooper',
        ),
      ),
    ],
    location: Location(
      formattedAddress: '789 Sushi St, Roll City, RC 23456',
    ),
  ),
  Restaurant(
    id: '4',
    name: 'Taco Haven',
    price: '\$',
    rating: 4.2,
    photos: [
      'https://phantom-marca.unidadeditorial.es/3d02ae4f69cb70e76206ba49e8de0fbc/resize/828/f/jpg/assets/multimedia/imagenes/2024/02/23/17087165658783.jpg',
      'https://images.unsplash.com/photo-1582960715727-4a7db5283a7f',
    ],
    categories: [
      Category(alias: 'mexican', title: 'Mexican'),
    ],
    hours: [
      const Hours(isOpenNow: true),
    ],
    reviews: [
      const Review(
        id: 'r4',
        rating: 4,
        text: 'Tacos are great, but the service is slow.',
        user: User(
          id: 'u4',
          imageUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
          name: 'Bob Brown',
        ),
      ),
    ],
    location: Location(
      formattedAddress: '321 Taco Ave, Spice City, SC 34567',
    ),
  ),
  Restaurant(
    id: '5',
    name: 'Vegan Delight',
    price: '\$\$',
    rating: 4.7,
    photos: [
      'https://pics.filmaffinity.com/harry_potter_and_the_sorcerer_s_stone-154820574-mmed.jpg',
      'https://images.unsplash.com/photo-1556914182-4ad1a5d33cfc',
    ],
    categories: [
      Category(alias: 'vegan', title: 'Vegan'),
    ],
    hours: [
      const Hours(isOpenNow: false),
    ],
    reviews: [
      const Review(
        id: 'r5',
        rating: 5,
        text: 'Excellent vegan options. A must-visit for vegans!',
        user: User(
          id: 'u5',
          imageUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
          name: 'Emma Davis',
        ),
      ),
    ],
    location: Location(
      formattedAddress: '654 Vegan Way, Herb City, HC 45678',
    ),
  ),
];
