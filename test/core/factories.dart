import 'package:faker/faker.dart';
import 'package:restaurant_tour/data/models/category_model.dart';
import 'package:restaurant_tour/data/models/local_restaurant_model.dart';
import 'package:restaurant_tour/data/models/remote_restaurant_model.dart';
import 'package:restaurant_tour/data/models/review_model.dart';
import 'package:restaurant_tour/data/models/user_model.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';

RemoteRestaurantModel makeRemoteRestaurantModel() {
  return RemoteRestaurantModel(
    id: faker.guid.guid(),
    categories: makeListCategoryModel(),
    isOpen: faker.randomGenerator.boolean(),
    address: faker.address.streetAddress(),
    name: faker.person.name(),
    photos: [],
    price: faker.randomGenerator.decimal(scale: 15, min: 5).toString(),
    rating: faker.randomGenerator.decimal(min: 1),
    reviews: makeListReviewModel(),
  );
}

LocalRestaurantModel makeLocalResturantModel() {
  return LocalRestaurantModel(
    id: faker.guid.guid(),
    categories: makeListCategoryModel(),
    isOpen: faker.randomGenerator.boolean(),
    address: faker.address.streetAddress(),
    name: faker.person.name(),
    photos: [],
    price: faker.randomGenerator.decimal(scale: 15, min: 5).toString(),
    rating: faker.randomGenerator.decimal(min: 1),
    reviews: makeListReviewModel(),
  );
}

List<CategoryModel> makeListCategoryModel() {
  return List.generate(10, (_) => makeCategoryModel());
}

CategoryModel makeCategoryModel() {
  return CategoryModel(title: faker.lorem.sentence(), alias: faker.lorem.word());
}

List<ReviewModel> makeListReviewModel() {
  return List.generate(5, (_) => makeReviewModel());
}

ReviewModel makeReviewModel() {
  return ReviewModel(
    id: faker.guid.guid(),
    rating: faker.randomGenerator.integer(5, min: 1),
    text: faker.lorem.word(),
    user: makeUserModel(),
  );
}

UserModel makeUserModel() {
  return UserModel(
    id: faker.guid.guid(),
    imageUrl: '',
    name: faker.person.name(),
  );
}

List<RestaurantEntity> makeListRestaurantEntity() {
  return List.generate(4, (_) => makeRestaurantEntity());
}

RestaurantEntity makeRestaurantEntity() {
  return RestaurantEntity(
    id: faker.guid.guid(),
    categories: makeListCategoryEntity(),
    isOpen: faker.randomGenerator.boolean(),
    address: faker.address.streetAddress(),
    name: faker.person.name(),
    photos: [],
    price: faker.randomGenerator.decimal(scale: 15, min: 5).toString(),
    rating: faker.randomGenerator.decimal(min: 1),
    reviews: makeListReviewEntity(),
  );
}

List<FavoriteRestaurantEntity> makeListFavoriteRestaurantEntity() {
  return List.generate(4, (_) => makeFavoriteRestaurantEntity());
}

FavoriteRestaurantEntity makeFavoriteRestaurantEntity() {
  return FavoriteRestaurantEntity(
    id: faker.guid.guid(),
    categories: makeListCategoryEntity(),
    isOpen: faker.randomGenerator.boolean(),
    address: faker.address.streetAddress(),
    name: faker.person.name(),
    photos: [],
    price: faker.randomGenerator.decimal(scale: 15, min: 5).toString(),
    rating: faker.randomGenerator.decimal(min: 1),
    reviews: makeListReviewEntity(),
  );
}

List<CategoryEntity> makeListCategoryEntity() {
  return List.generate(10, (_) => makeCategoryEntity());
}

CategoryEntity makeCategoryEntity() {
  return CategoryEntity(title: faker.lorem.sentence(), alias: faker.lorem.word());
}

List<ReviewEntity> makeListReviewEntity() {
  return List.generate(5, (_) => makeReviewEntity());
}

ReviewEntity makeReviewEntity() {
  return ReviewEntity(
    id: faker.guid.guid(),
    rating: faker.randomGenerator.integer(5, min: 1),
    text: faker.lorem.word(),
    user: makeUserEntity(),
  );
}

UserEntity makeUserEntity() {
  return UserEntity(
    id: faker.guid.guid(),
    imageUrl: '',
    name: faker.person.name(),
  );
}

List<Map> makeRemoteRestaurantsJson() {
  return List.generate(
    4,
    (_) => {
      'id': faker.guid.guid(),
      'categories': List.generate(4, (_) => makeCategoryModel().toJson()),
      'hours': [
        {'is_open_now': faker.randomGenerator.boolean()},
      ],
      'location': {'formatted_address': faker.address.streetAddress()},
      'name': faker.person.name(),
      'photos': [],
      'price': '\$\$\$',
      'rating': faker.randomGenerator.decimal(min: 1),
      'reviews': List.generate(3, (_) => makeReviewModel().toJson()),
    },
  );
}

List<Map> makeLocalRestaurantsJson() {
  return List.generate(5, (_) => makeLocalResturantModel().toJson());
}

Map makeInvalidJson() {
  return {
    'data': {
      'id': faker.guid.guid(),
      'categories': null,
    },
  };
}
