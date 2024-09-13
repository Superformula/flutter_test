# Restaurant Tour

This Flutter project is created as a response to **Superformula's** coding challenge. Below you’ll find the instructions on how to configure and run the project, as well as a brief overview of the technologies used.

## Project Setup

### Prerequisites

Install dependencies using `fvm`: This project uses [fvm](https://fvm.app/) to manage the Flutter version.

- **Install `fvm`** if you don’t have it installed:

  ```sh
  dart pub global activate fvm
  ```

  Make sure you add `~/.pub-cache/bin` to your PATH if necessary.

- **Use the Flutter version specified in the project**:

  ```sh
  fvm use
  ```

- **Install all the project dependencies**:

  ```sh
  fvm flutter pub get
  ```

### Environment Configuration

Create a `.env` file in the root of the project with the following variables:

```env
YELP_API_KEY=your_yelp_api_key
USE_FAKE_DATA=false
```

If you don’t want to use the Yelp API, you can set `USE_FAKE_DATA=true` to use mocked restaurant data instead of fetching from Yelp.

### Running the App

After configuring the environment, run the app with the following command:

```sh
fvm flutter run
```

## Overview of the Project

### State Management

The project utilizes **Cubits** (from the `flutter_bloc` package) for state management, offering a clear separation of concerns. The user’s favorite restaurant data is persisted locally using **HydratedBloc**, which stores the data across app sessions.

### Local Data Persistence

- **Favorites**: The app uses `hydrated_bloc` to store the user's favorite restaurants locally. This ensures that even when the app is restarted, the user’s favorite restaurants are preserved.

### Tests

The project includes a number of tests to demonstrate knowledge of unit testing and widget testing. While not every single part of the app has full test coverage, the main parts are well tested to show how to approach Flutter testing with tools such as `bloc_test` and `mocktail`.

## Test Coverage Reports

To generate the test coverage reports for this project, **LCOV** was used.

### Generating a Coverage Report

To generate the LCOV report:

1. Run the following command to collect coverage information:

   ```sh
   fvm flutter test --coverage
   ```

2. Generate the LCOV report:

   ```sh
   genhtml coverage/lcov.info -o coverage/
   ```

3. Open the `index.html` file from the generated `coverage/` folder to view the detailed coverage report.

The report provides a breakdown of the test coverage across all directories and files in the project, ensuring that key areas are well tested.
