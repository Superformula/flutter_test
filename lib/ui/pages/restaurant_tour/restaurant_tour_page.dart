import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/presentation/restaurant_tour/cubit_restaurant_tour_presenter.dart';

import '../../../domain/entities/entities.dart';
import '../../../presentation/presentation.dart';
import '../../../typography.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';

part 'widgets/app_bar.dart';
part 'widgets/message_content.dart';
part 'widgets/image.dart';
part 'widgets/favorite_restaurant_list.dart';
part 'widgets/restaurant_item.dart';
part 'widgets/restaurant_list.dart';
part 'widgets/snack_bar.dart';

class RestaurantTourPage extends StatefulWidget {
  final RestaurantTourPresenter _presenter;

  const RestaurantTourPage({
    super.key,
    required RestaurantTourPresenter presenter,
  }) : _presenter = presenter;

  @override
  State<RestaurantTourPage> createState() => _RestaurantTourPageState();
}

class _RestaurantTourPageState extends State<RestaurantTourPage> with SingleTickerProviderStateMixin {
  late final CubitRestaurantTourPresenter _bloc;
  late final TabController _tabController;

  void _setUp() {
    _bloc = widget._presenter as CubitRestaurantTourPresenter;
    _tabController = TabController(length: 2, vsync: this);
  }

  void _dispose() {
    _bloc.dispose();
    _tabController.dispose();
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
    return BlocProvider(
      create: (_) => _bloc,
      child: DefaultTabController(
        length: _tabController.length,
        child: Scaffold(
          appBar: _AppBar(_tabController),
          body: BlocConsumer<CubitRestaurantTourPresenter, RestaurantState>(
            listener: (context, state) {
              if (state is RestaurantErrorState) showSnackBar(context, state: state);
            },
            bloc: _bloc,
            builder: (context, state) {
              if (state is RestaurantLoadingState) {
                return const Center(child: CircularLoading());
              }

              return TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _RestaurantList(),
                  _FavoriteRestaurantList(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
