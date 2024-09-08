# Overview of the MVVM Architecture
In this project, I implemented the Model-View-ViewModel (MVVM) architecture using Provider for state management. This approach separates the code into distinct layers, making the project scalable, readable, and testable.

## MVVM Breakdown
### Model (M)
The Model represents the data layer of the app. In this case:

Restaurant objects: Data fetched from the Yelp API, representing properties like id, name, price, etc.
Database interaction: Using DBHelper to manage favorites stored locally.
### View (V)
The View is the UI layer built with Flutter widgets. It observes changes from the ViewModel and updates the UI accordingly. Key views include:

YelpListView: Displays a list of restaurants.
YelpDetailView: Shows detailed information for a selected restaurant.
FavoritesView: Displays a list of favorite restaurants.
The View reacts to data changes from the ViewModel via Provider.

### ViewModel (VM)
The ViewModel connects the View and Model, handling business logic and preparing data for the UI. Key ViewModels include:

YelpListViewModel: Fetches and manages the list of restaurants.
YelpDetailViewModel: Manages the state of a single restaurant.
FavoritesViewModel: Handles adding/removing favorites and fetching them from the database.
The ViewModel notifies the View of any changes via notifyListeners().

## State Management with Provider
I used Provider for state management, allowing views to listen to changes in the ViewModel. The ChangeNotifier class was used in each ViewModel to trigger UI updates. I utilized MultiProvider to register the ViewModels globally.

## Additional Features
- Caching: Cached favorite restaurants are stored in the ViewModel to avoid repeated API calls.
- Error Handling: I added error handling in the API calls to gracefully manage failures.
- Mocking for Testing: Using Mockito, I mocked API responses and database interactions for testing ViewModels.

## Advantages
- Separation of Concerns: Clean separation between UI, business logic, and data access.
- Testability: ViewModels can be easily unit-tested.
- Scalability: As the app grows, I can add more ViewModels and Views without increasing complexity.

This MVVM architecture, combined with Provider, ensures the app is structured, testable, and maintainable.
