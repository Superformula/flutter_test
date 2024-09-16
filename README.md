# Superformula Mobile Test

@paolojoaquinp

## Summary
This initiative embraces Clean Architecture tenets with a Feature-First methodology, crafted for productive and systematic development. It leverages Yelp's GraphQL API for restaurant data retrieval, augmented by a JSON file containing cached information to address Yelp's daily query constraints. Subsequent establishment specifics and patron evaluations are obtained in real-time.

## Code Structure
The source code is divided into several directories, mirroring the conceptual separation advocated by Clean Architecture guidelines:

- `core`: Encompasses fundamental utilities and facilitators such as `dio_helper.dart` for network communication and `hive_helper.dart` for local data retention.
- `models`: Encompasses data structures like `restaurant.dart`.
- `navigation`: Oversees application traversal via files such as `route_navigator.dart`.
- `services`: Facilitates initialization and service configuration through `app_init.dart`.
- `features`: Categorized by individual views/screens, e.g., `home_page` and `restaurant_page`, each feature encapsulating its own business rules, data handling, and UI logic.
- `repositories`: Houses `yelp_repository.dart` for interfacing with the Yelp API.
- `shared`: Accommodates reusable UI components like `single_restaurant_card` and utility elements such as `status_indicator.dart`.

Furthermore, the project utilizes `dotenv` for environment variable administration, enhancing security and adaptability.

## How to install it
Prior to executing the project, establish an `.env` file make a copy from the `.env.example` file in the project's root directory with the following entry:

YELP_API_KEY=thisISanApiKEYYouMUSTAdd

## Code
This app use `oxidized` for functional programming constructs, fostering a more resilient, fault-tolerant development ecosystem.