import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/viewmodels/yelp_list_viewmodel.dart';
import 'package:restaurant_tour/views/restaurant_tile.dart';
import 'package:restaurant_tour/views/yelp_detailview.dart';
import '../viewmodels/yelp_detail_viewmodel.dart';

class YelpListView extends StatefulWidget {
  @override
  _YelpListViewState createState() => _YelpListViewState();
}

class _YelpListViewState extends State<YelpListView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Trigger fetching data
    final viewModel = Provider.of<YelpListViewModel>(context, listen: false);
    viewModel.debounceFetch();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<YelpListViewModel>();
    final detailViewModel = Provider.of<YelpDetailViewModel>(context, listen: false);

    return RefreshIndicator(
      onRefresh: viewModel.refreshYelpItems,
      child: viewModel.isLoading && viewModel.restaurants.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: viewModel.restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = viewModel.restaurants[index];
          return RestaurantTile(
            restaurant: restaurant,
            onTap: () {
              if (MediaQuery.of(context).size.width < 600) {
                // Mobile: Push to a new screen with a new provider for YelpDetailViewModel
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => YelpDetailViewModel()..selectRestaurant(restaurant),
                      child: YelpDetailView(),
                    ),
                  ),
                );
              } else {
                // Split-view: Update the selected restaurant
                detailViewModel.selectRestaurant(restaurant);
              }
            },
          );
        },
      ),
    );
  }
}

