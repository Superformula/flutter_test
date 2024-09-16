import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/presentation.dart';
import '../../../typography.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';

part 'widgets/app_bar.dart';
part 'widgets/image.dart';
part 'widgets/restaurant_item.dart';

class RestaurantTourPage extends StatefulWidget {
  final RestaurantTourPresenter _presenter;

  const RestaurantTourPage({
    super.key,
    required RestaurantTourPresenter presenter,
  }) : _presenter = presenter;

  @override
  State<RestaurantTourPage> createState() => _RestaurantTourPageState();
}

class _RestaurantTourPageState extends State<RestaurantTourPage> {
  late final CubitRestaurantTourPresenter _bloc;

  void _setUp() {
    _bloc = widget._presenter as CubitRestaurantTourPresenter;
  }

  void _dispose() {
    _bloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    _setUp();
  }

  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const _AppBar(),
        body: BlocBuilder<CubitRestaurantTourPresenter, RestaurantState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is RestaurantLoadingState) return const Center(child: CircularLoading());
            if (state is RestaurantErrorState) return Center(child: Text(state.message));
            return TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: const [
                    _RestaurantItem(),
                  ],
                ),
                const Center(child: Text('My Favorites Content')),
              ],
            );
          },
        ),
      ),
    );
  }
}
