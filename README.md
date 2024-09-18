# Superformula Flutter Test

Restaurant from yelp API.

### Installing

1. Clone the repository:

   ```bash
   git clone https://github.com/enzoftware/flutter_test.git
   cd flutter_test
   ```

2. Install the dependencies:

   ```bash
   flutter pub get
   ```

3. Add your API Key:
  Create `api_keys.json`, and follow the `api_keys_example.json` to add your TheMovieDB API key:

     ```json
    {
      "API_KEY":"your_api_key"
    }
     ```

4. Run the app on an emulator or physical device:

   ```bash
   flutter run --dart-define-from-file api_keys.json
   ```

### Project Structure

``` bash
/lib
  /favorite_restaurants_list  #favorite restaurants features
  /restaurant_detail  # Detail for restaurant
  /restaurant_list  # Restaurant list
/packages
  /restaurant_gql_client   # API client to handle Yelp requests
  /restaurant_models   # Models for restaurant
  /restaurant_repository   # Repository layer abstracting API logic
  /restaurant_ui    # Reusable UI components
```

### Demo

<img src="https://github.com/user-attachments/assets/4fab1086-6c1d-47e6-af72-ec883d76a3fe" width="280" />
<img src="https://github.com/user-attachments/assets/e5854e3b-2560-439e-b803-65dd61f711e6" width="280" />
<img src="https://github.com/user-attachments/assets/704c0f3e-d77c-437b-ac28-f9235585f645" width="280" />
<img src="https://github.com/user-attachments/assets/4b122518-e465-45a1-a54a-ba21a6bc57ee" width="280"/>


