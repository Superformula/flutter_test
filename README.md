# Restaurant Tour

## How to test

If you want to test agains the HTTP Yelp repository, you should provide the API
key through a `--dart-define`:

```
flutter run --dart-define=YELP_API_KEY=<your_key>
```

If the key is not provided, the mocked repository will be used insted.

The mocked repository contains data of the real API, but is mocked. Also, it
fakes the connection throttle so the loading state can be seen.
