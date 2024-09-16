import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/home/presentation/widgets/loading.dart';

import '../bloc/home_bloc.dart';
import '../tabs/all_restaurants_tab.dart';
import '../tabs/my_favorities_tab.dart';
import '../tabs/tab_item.dart';
import '../widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const HeaderHome(
              text: 'Restaurant Tour',
            ),
            centerTitle: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                color: Colors.white,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const TabBar(
                  tabAlignment: TabAlignment.center,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  tabs: [
                    TabItem(
                      title: 'All Restaurants',
                    ),
                    TabItem(
                      title: 'My Favorities',
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: BlocBuilder<RestaurantsBloc, RestaurantsState>(
            builder: (context, state) {
              if (state is LoadingRestaurantsState) {
                return const Loading();
              } else if (state is ResultRestaurantsState) {
                return TabBarView(
                  children: [
                    RefreshIndicator(
                      onRefresh: () {
                        context
                            .read<RestaurantsBloc>()
                            .add(GetAllRestaurantsEvent());
                        return Future.delayed(
                          const Duration(seconds: 0),
                        );
                      },
                      child: AllRestaurantsTab(
                        allRestaurants: state.listRestaurants['allRestaurants']
                                ?.restaurants ??
                            [],
                      ),
                    ),
                    RefreshIndicator(
                      onRefresh: () {
                        context
                            .read<RestaurantsBloc>()
                            .add(GetAllRestaurantsEvent());
                        return Future.delayed(
                          const Duration(seconds: 0),
                        );
                      },
                      child: MyFavoritiesTab(
                        favoritiesRestaurants: state
                                .listRestaurants['favoritiesRestaurants']
                                ?.restaurants ??
                            [],
                      ),
                    ),
                  ],
                );
              } else if (state is ErrorRestaurantsState) {
                return Center(child: Text(state.error.message));
              } else {
                return const Loading();
              }
            },
          ),
        ),
      ),
    );
  }
}
