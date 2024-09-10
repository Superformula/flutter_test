# RestauranTour App Documentation

## Overview

The RestaurantTour app connects to the Yelp database to provide a list of restaurants, allowing users to view detailed restaurant information, and favorite restaurants.  
The app follows a **Clean Architecture** design pattern, with **Riverpod** for state management, **Dio** for networking, and **Mockito** for API testing.

## Architecture

The project follows a **Clean Architecture** design pattern that organizes code distribution in a specific manner, with three primary outer layers as folders.

### Layers:
1. **Presentation Layer**:
    - Manages UI, Widgets, and State Management (using **Riverpod**).

2. **Domain Layer**:
    - Contains business logic, use cases, and entities. In this case, the layer is provided as `models`.

3. **Data Layer**:
    - Manages repositories, networking (using **Dio**), and data sources. In this case, the layer is provided as `repositories`.

### Additional Folder:

- **Core**: Contains functionality that may not fit well with the definition of the standard layers. In this project, the following subfolders were added:
    - **Config**: Contains a `strings` file, allowing string manipulation to be detached from the app's logic.
    - **Utils**: Stores the `router manager` for handling navigation.

## State Management

**Riverpod** was selected as the state manager for its ease of use.  
In this project, Riverpod handles the state of the restaurant list and the favorites functionality.

### Example:

```dart
final restaurantListProvider = FutureProvider<List<Restaurant>>((ref) async {
  final repository = ref.watch(restaurantRepositoryProvider);
  return repository.getRestaurants();
});
```
## Routing and Navigation

The app has three pages, and the following routes are used to navigate between them:
```dart
class Routes {
  static const String main = '/';
  static const String restaurantList = '/restaurantList';
  static const String restaurantDetails = '/restaurantDetails';
}
```

## Error Handling

The main source of errors in this app comes from null values in the restaurant list.
We handle these errors at the UI level to prevent crashes. For example:

```dart
Text(restaurant.price ?? '$$')
```

## Testing

### Unit Tests

1. **Presentation Layer**:
    - Created tests that check whether the toggle favorite functionality correctly adds, contains, and deletes restaurants from the favorites list.

2. **Domain Layer**:
    - Created tests that ensure the fromJson and toJson methods produce the correct object and JSON respectively.

3. **Data Layer**:
    - Created tests that check whether the API call returns a valid list of restaurants.

### Widget Tests

The only meaningful widget that changes state based on user interaction is the Favorite icon in the Details Page.
A test was created to check if the icon changes properly every time a tap is performed.