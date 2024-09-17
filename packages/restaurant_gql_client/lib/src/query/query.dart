/// Generates a GraphQL query string to fetch a list of restaurants.
///
/// This query retrieves 20 restaurants based on the provided offset from the
/// location "Las Vegas". The query includes essential restaurant details like
/// name, price, rating, photos, categories, hours of operation, location, and
/// reviews, along with the user details who provided the review.
///
/// The result set includes:
/// - `total`: The total number of restaurants available.
/// - `business`: List of restaurants, with each restaurant containing:
///   - `id`: Unique identifier for the restaurant.
///   - `name`: Name of the restaurant.
///   - `price`: Price level of the restaurant (e.g., $, $$, $$$).
///   - `rating`: The average rating of the restaurant.
///   - `photos`: A list of photo URLs for the restaurant.
///   - `reviews`: A list of reviews with details like:
///     - `id`: Review ID.
///     - `rating`: Rating given by the user.
///     - `text`: Review text.
///     - `user`: The user who posted the review, containing:
///       - `id`: User ID.
///       - `image_url`: User's profile picture URL.
///       - `name`: User's name.
///   - `categories`: List of categories associated with the restaurant,
/// containing:
///     - `title`: Category title.
///     - `alias`: Category alias.
///   - `hours`: Operating hours of the restaurant, containing:
///     - `is_open_now`: Whether the restaurant is currently open.
///   - `location`: The formatted address of the restaurant.
///
/// The query accepts an `offset` parameter, which is used for paginating
/// the list of restaurants.
///
/// Example:
/// ```dart
/// final gqlQuery = query(20); // Fetch the next 20 restaurants.
/// print(gqlQuery);
/// ```
///
/// [offset]: The offset value for paginated results, allowing for fetching
/// restaurants in batches of 20.
///
/// Returns:
/// A `String` representing the GraphQL query to fetch restaurants from the
/// specified location with pagination support.
String query(int offset) => '''
  query getRestaurants {
    search(location: "Las Vegas", limit: 20, offset: $offset) {
      total
      business {
        id
        name
        price
        rating
        photos
        reviews {
          id
          rating
          text
          user {
            id
            image_url
            name
          }
        }
        categories {
          title
          alias
        }
        hours {
          is_open_now
        }
        location {
          formatted_address
        }
      }
    }
  }
  ''';
