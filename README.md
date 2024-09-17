# Restaurant Tour

## Overview

As part of the solution to the Superformula challenge, I implemented **Clean Architecture** by separating the project into layers: domain, infrastructure, and UI. I also used the **Provider** package for state management and **Shared Preferences** to store favorite items locally. Additionally, I incorporated various testing approaches, including unit, widget, golden, and integration tests. The UI design follows the principles of atomic design.
![App Demo](lib/screenshots/restaurant_tour_demo.gif)

<img src="screenshots/restaurant_tour_demo.gif" width="306" height="617"> 

## Technologies and Packages Used

- **Flutter**: Core framework for building the mobile application.
- **Provider**: Used for state management, allowing reactive UI updates and separation of business logic.
- **Shared Preferences**: To persist local data such as favorite restaurants across app sessions.
- **Mocktail**: To mock API responses during development and testing.
- **Dio**: HTTP client for making API requests.
- **Integration, widget, Unit Testing (golden)**: Mocks and test utilities for thoroughly testing features and API interactions.

## Project Structure

The app is organized into three main layers:
package structure

<img src="screenshots/folders.png" width="276" height="497">

### 1. **Domain Layer**
   - **Entities**: Defines the core business objects such as `RestaurantEntity`.
   - **Use Cases**: Contains the business logic. Example: Fetching restaurants or marking a restaurant as a favorite.
   - **Repositories**: Interfaces that act as contracts for the infrastructure layer.

### 2. **Infrastructure Layer**
   - **Data Sources**: API integrations and local data handling using Shared Preferences.
   - **Mappers**: Translates data between different layers (e.g., API model to domain entities).
   - **Repositories Implementations**: Concrete implementations of domain repositories using data sources.

### 3. **UI Layer**
   - **Widgets**: Flutter UI components such as `RestaurantListPage`, `FavoritesRestaurantsPage`, and `RestaurantDetailsPage`.
   - **State Management**: Handled by `RestaurantProvider` and `FavoritesProvider`, allowing efficient data handling and UI updates.
   - **Utilities**: Helpers for managing colors, styles, and constants throughout the app.

## Yelp API Configuration

To ensure the app works correctly, you need to configure the Yelp API key. Follow these steps:

1. Create a `.env` file in the root of the project.
2. Add your Yelp API key to the `.env` file with the following format:

```bash
YELP_API_KEY=your_api_key_here
```
##
Welcome to Superformula's Coding challenge, we are excited to see what you can build!

This take home test aims to evaluate your skills in building a Flutter application. We are looking for a well-structured and well-tested application that demonstrates your knowledge of Flutter and the Dart language.

We are not looking for pixel perfect designs, but we are looking for a well-structured application that demonstrates your skills and best practices developing a flutter application. We know there are many ways to solve a problem, and we are interested in seeing how you approach this one. If you have any questions, please don't hesitate to ask.

Things we'll be looking on your submission:
- App structure for scalability
- Error and optional (?) handling
- Widget tree optimization
- State management
- Test coverage

Think of the app you'll be building as the final product, do not over engineer it for possible future features, but do not under engineer it either. We are looking for a balance. We want that the functionalities that you implement are well thought out and implemented.

As an example, for the favorites feature you can simply use SharedPreferences, you don't need to use a complex database solution, but we're looking for a solid shared preferences implementation.



Be sure to read **all** of this document carefully, and follow the guidelines within.

## Vendorized Flutter

3. We use [fvm](https://fvm.app/) for managing the flutter version within the project. Using terminal, while being on the test repository, install the tools dependencies by running the following commands:

    ```sh
    dart pub global activate fvm
    ```

    The output of the command will ask to add the folder `./pub-cache/bin` to your PATH variables, if you didn't already. If that is the case, add it to your environment variables, and restart the terminal.

    ```sh
    export PATH="$PATH":"$HOME/.pub-cache/bin" # Add this to your environment variables
    ```

4. Install the project's flutter version using `fvm`.

    ```sh
    fvm use
    ```

5. From now on, you will run all the flutter commands with the `fvm` prefix. Get all the projects dependencies.

    ```sh
    fvm flutter pub get
    ```

More information on the approach can be found here:

> hhttps://fvm.app/docs/getting_started/installation

From the root directory:


### IDE Setup

<details>
<summary>Use with VSCode</summary>
<p>

If you're a VScode user link the new Flutter SDK path in your settings
`$projectRoot/.vscode/settings.json` (create if it doesn't exist yet)

```json
{
  "dart.flutterSdkPath": ".fvm/flutter_sdk"
}
```


</p>
</details>

<details>
<summary>Use with IntelliJ / Android Studio</summary>
<p>

Go to `Preferences > Languages & Frameworks > Flutter` and set the Flutter SDK path to `$projectRoot/.fvm/flutter_sdk`

<img width="800" alt="IntelliJ Settings" src="https://user-images.githubusercontent.com/1096485/64658026-3a1fdd00-d436-11e9-9457-556059f68e2c.png">

</p>
</details>

## Requirements

### App Structure

#### Restaurant List Page

- Tab Bar
  - List of favorites (stored client side)
  - List of businesses
    - Hero image
    - Name
    - Price
    - Category
    - Rating (rounded to the nearest value)
    - Open/Closed

#### Restaurant Detail View

- Ability to favorite a business
- Name
- Hero image
- Price and category
- Address
- Rating
- Total reviews
- List of reviews
  - User name
  - Rating
  - User image
  - Review Text (These are just snippets of the full review, usually like 3-4 lines long)

#### Misc.

- Clear documentation on the structure and architecture of your application.
- Clear and logical commit messages.
  - We suggest following [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)

## Test Coverage

To demonstrate your experience writing different types of tests in Flutter please do the following:

- We are looking to see how you write tests in Flutter. We are not looking for 100% coverage but we are looking for a good mix of unit and widget tests.
- We are specially looking for you to cover at least one file for each domain layer (interface, application, repositories, etc).

Feel free to add more tests as you see fit but the above is the minimum requirement.

## Design

- See this [Figma File](https://www.figma.com/file/KsEhQUp66m9yeVkvQ0hSZm/Flutter-Test?node-id=0%3A1) for design information related to the overall look and feel of the application. We do not expect pixel-perfection but would like the application to visually be close to what is specified in the Figma file.

![List View](screenshots/listview.png)
![Detail View](screenshots/detailview.png)

## API

The [Yelp GraphQL API](https://www.yelp.com/developers/graphql/guides/intro) is used as the API for this Application. We have provided the boilerplate of the API requests and backing data models to save you some time. To successfully make a request to the Yelp GraphQL API, please follow these steps:

1. Please go to https://www.yelp.com/signup and sign up for a developer account.
1. Once signed up, navigate to https://www.yelp.com/developers/v3/manage_app.
1. Create a new app by filling out the required information.
1. Once your app is created, scroll down and join the `Developer Beta`. This allows you to use the GraphQL API.
1. Copy your API Key from your app page and paste it on `line 5` [yelp_repository.dart](app/lib/yelp_repository.dart) replacing the `<PUT YOUR API KEY HERE>` with your key.
1. Run the app and tap the `Fetch Restaurants` button. If you see a log like `Fetched x restaurants` you are all set!

## Technical Requirements

### State Management

Please restrict your usage of state management or dependency injection to the following options:

1. [provider](https://pub.dev/packages/provider)
2. [Riverpod](https://pub.dev/packages/riverpod)
3. [bloc](https://pub.dev/packages/bloc)
4. [get_it](https://pub.dev/packages/get_it)/[get_it_mixins](https://pub.dev/packages/get_it_mixin)
5. [Mobx](https://pub.dev/packages/mobx)

We ask this because this challenge values consistency and efficiency over ingenuity. Using commonly used libraries ensures that we can review your code in a timely manner and allows us to provide better feedback.

## Coding Values

At **Superformula** we strive to build applications that have

- Consistent architecture
- Extensible, clean code
- Solid testing
- Good security & performance best practices

### Clear, consistent architecture

Approach your submission as if it were a real world app. This includes Use any libraries that you would normally choose.

_Please note: we're interested in your code & the way you solve the problem, not how well you can use a particular library or feature._

### Easy to understand

Writing boring code that is easy to follow is essential at **Superformula**.

We're interested in your method and how you approach the problem just as much as we're interested in the end result.

### Solid testing approach

While the purpose of this challenge is not to gauge whether you can achieve 100% test coverage, we do seek to evaluate whether you know how & what to test.

## Q&A

> Where should I send back the result when I'm done?

Please fork this repo and then send us a pull request to our repo when you think you are done. There is no deadline for this task unless otherwise noted to you directly.

> What if I have a question?

Just create a new issue in this repo and we will respond and get back to you quickly.

## Review

The coding challenge is a take-home test upon which we'll be conducting a thorough code review once complete. The review will consist of meeting some more of our mobile engineers and giving a review of the solution you have designed. Please be prepared to share your screen and run/demo the application to the group. During this process, the engineers will be asking questions.
