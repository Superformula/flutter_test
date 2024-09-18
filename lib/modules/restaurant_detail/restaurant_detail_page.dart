import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant_tour/design_system/design_system.dart';
import 'package:restaurant_tour/modules/restaurant_detail/bloc/restaurant_detail_bloc.dart';
import 'package:restaurant_tour/modules/restaurant_detail/models/detail_page_arguments.dart';
import 'package:restaurant_tour/modules/restaurant_detail/restaurant_detail_repository.dart';
import 'package:restaurant_tour/modules/restaurant_detail/widgets/review_list.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Content();
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final detailPageArgurments =
        args != null ? args as DetailPageArgurments : null;

    return BlocProvider(
      create: (context) => RestaurantDetailBloc(
        restaurantDetailRepository: RestaurantDetailRepository(),
      )..add(
          LoadDetailEvent(
            detailPageArgurments: detailPageArgurments,
          ),
        ),
      child: BlocConsumer<RestaurantDetailBloc, RestaurantDetailState>(
        listener: (context, state) {
          if (state is ErrorLoadDetailState) {
            context.showDsSnackBar(
              message: 'Error when loaded details',
              type: SnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          final restaurant = state.model.restaurant;
          final isFavorite = state.model.isFavorite ?? false;

          return Scaffold(
            appBar: AppBar(
              title: DsText(
                restaurant?.name ?? 'No name',
                textVariant: TextVariant.subTitle,
                isBold: true,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () => context.read<RestaurantDetailBloc>().add(
                        SetFavoriteEvent(
                          isFavorite: !isFavorite,
                        ),
                      ),
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline_rounded,
                  ),
                ),
              ],
            ),
            body: state is LoadingDetailState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          width: double.infinity,
                          color: Colors.grey,
                          child: DsImageNetwork(
                            urlImage: restaurant?.heroImage,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(DsSizes.md),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DsText(restaurant?.price ?? '---'),
                                  StatusOpen(
                                    isOpenNow: restaurant?.isOpen ?? false,
                                  ),
                                ],
                              ),
                              const SizedBox(height: DsSizes.md),
                              const Divider(),
                              const SizedBox(height: DsSizes.md),
                              const DsText('Address'),
                              DsText(
                                restaurant?.location?.formattedAddress ??
                                    'No address',
                                isBold: true,
                              ),
                              const SizedBox(height: DsSizes.md),
                              const Divider(),
                              const SizedBox(height: DsSizes.md),
                              const DsText('Overral Rating'),
                              Row(
                                children: [
                                  DsText(
                                    (restaurant?.rating ?? 0).toString(),
                                    textVariant: TextVariant.title,
                                    isBold: true,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.stars,
                                  ),
                                ],
                              ),
                              const SizedBox(height: DsSizes.md),
                              const Divider(),
                              DsText(
                                '${restaurant?.reviews?.length ?? 0} reviews',
                              ),
                              ReviewList(reviews: restaurant?.reviews ?? []),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
