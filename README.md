# RestaurantTour App

In order to run the app, one must provide the Yelp API key as well as the API endpoint as follows:

```bash
$ flutter run --dart-define=API_KEY=<API_KEY_VALUE_HERE> --dart-define=API_URL=<API_URL_VALUE_HERE>
```
### General considerations

While developing the app, I've faced some issues with the Yelp API that slowed me down. I know it has limits,
but some times during integration it seem unstable, claiming that some of my requests had syntax erros, which
was not the case.

# Architecture considerations

For this project, I choose to follow the Android Architecture guidelines and use a MVVM approach, but adapted to work in a reactive environment such as Flutter. The state management was done using bloc.

The details of the followed architecture can be see here: https://developer.android.com/topic/architecture/ui-layer

# How to become a tester

