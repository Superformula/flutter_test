# Restaurant Tour

## Overview

This project is a solution to the **Superformula's Coding Challenge**, designed to demonstrate skills in Flutter development and architecture. The focus of the project is on creating a scalable, well-structured, and well-tested Flutter application that allows users to explore restaurants using the Yelp GraphQL API.

## Key Features

- **Restaurant Tour Page**: Displays a list of restaurants, allowing users to view details and add favorites. The app also shows restaurants by categories such as price, name, and rating.
- **Restaurant Detail Page**: Provides detailed information about the selected restaurant, including user reviews, restaurant category, and other essential details.
- **Favorites Feature**: Users can favorite businesses, with favorites being stored locally using **SharedPreferences**.

## Architecture and State Management

This application follows the principles of **Clean Architecture** to ensure scalability, separation of concerns, and maintainability. The following layers were implemented:

1. **Domain Layer**: Contains the business logic, including the use of usecases and entities.
2. **Data Layer**: Responsible for data fetching and caching, using the Yelp GraphQL API and storing API keys using the `flutter_dotenv` package for secure management.
3. **Presentation Layer**: Flutter widgets and state management using **flutter_bloc** for managing UI states, and reactions.

I utilized several design patterns to create a solid structure, such as:
- **Factory Pattern**: For creating complex objects and handling dependencies dynamically.
- **Adapter Pattern**: To allow integration of different API responses with internal models.
- **Strategy Pattern**: For handling various business logic strategies.
  
In addition, I applied **SOLID** principles where appropriate, ensuring that classes and components are modular, extensible, and maintainable.

### State Management

The state management in this project is handled using the **flutter_bloc** library.

### API Key Management

The **flutter_dotenv** package is used to securely store and manage the API Key needed for communicating with the Yelp GraphQL API. The API key is stored in an environment file, which is then loaded into the application at runtime.

## Testing

A comprehensive test strategy was implemented to cover different parts of the application. The project includes:
- **Unit Tests**: For testing business logic and data manipulation within usecases and adapters.
- **Widget Tests**: For testing the UI components.

## Steps to run the application

## 1. Install fvm

1. [fvm](https://fvm.app/) for managing the flutter version within the project. Using terminal, while being on the test repository, install the tools dependencies by running the following commands:

    ```sh
    dart pub global activate fvm
    ```

    The output of the command will ask to add the folder `./pub-cache/bin` to your PATH variables, if you didn't already. If that is the case, add it to your environment variables, and restart the terminal.

    ```sh
    export PATH="$PATH":"$HOME/.pub-cache/bin" # Add this to your environment variables
    ```

2. Install the project's flutter version using `fvm`.

    ```sh
    fvm use
    ```

3. From now on, you will run all the flutter commands with the `fvm` prefix. Get all the projects dependencies.

    ```sh
    fvm flutter pub get
    ```

### 2. Create the environment file

1. Create a .env file in the root of your project with the following content:

    ```bash
    API_KEY=API_KEY
    BASE_URL=BASE_URL

### 3. Run on iOS simulator

1. Open the iOS simulator via terminal:

    ```bash
    open -a Simulator

2. With the iOS simulator running, go back to the Flutter project root directory and run:

    ```bash
    flutter run

