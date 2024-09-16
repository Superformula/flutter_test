import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/features/home_page/presenter/bloc/home_screen_bloc.dart';
import 'package:restaurant_tour/features/home_page/presenter/page/widgets/all_restaurants_tab.dart';
import 'package:restaurant_tour/features/home_page/presenter/page/widgets/my_favorites_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenBloc>(
      create: (context) => HomeScreenBloc(),
      child: _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'RestauranTour',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Material(
            elevation: 6.0,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'All Restaurants'),
                  Tab(text: 'My Favorites'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
