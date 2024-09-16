import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../presentation/presentation.dart';
import '../../../typography.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';

part 'widgets/app_bar.dart';
part 'widgets/error_content.dart';
part 'widgets/image.dart';
part 'widgets/restaurant_item.dart';
part 'widgets/restaurant_list.dart';

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
    return BlocProvider(
      create: (_) => _bloc,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const _AppBar(),
          body: BlocBuilder<CubitRestaurantTourPresenter, RestaurantState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is RestaurantLoadingState) {
                return const Center(child: CircularLoading());
              }

              if (state is RestaurantErrorState) {
                return _ErrorContent(state.message);
              }

              return const TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _RestaurantList(),
                  Center(child: Text('My Favorites Content')),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
