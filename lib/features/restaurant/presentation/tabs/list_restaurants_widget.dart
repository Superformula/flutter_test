import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/utils/app_keys.dart';
import 'package:restaurant_tour/di.dart';
import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant/presentation/pages/restaurant_details_page.dart';
import 'package:restaurant_tour/features/restaurant/presentation/widgets/custom_rating_bar.dart';

import '../manager/home_cubit.dart';
import '../widgets/open_closed_widget.dart';

class ListRestaurants extends StatelessWidget {
  const ListRestaurants({super.key, required this.restaurants});
  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key(AppKeys.listRestaurantsFetched),
      padding: const EdgeInsets.all(12),
      itemCount: restaurants.length,
      itemBuilder: (c, i) {
        final Restaurant restaurant = restaurants[i];
        return GestureDetector(
          onTap: () async {
            final cubit = getIt.get<HomeCubit>();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: cubit,
                  child: RestaurantDetailsPage(
                    restaurant: restaurant,
                  ),
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.12),
                  blurRadius: 5.0,
                  spreadRadius: 0,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: ValueKey(restaurant.id!),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      height: 88,
                      width: 88,
                      fit: BoxFit.cover,
                      imageUrl: restaurant.photos!.first,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: Colors.black,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 88,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Text(
                            restaurant.name!,
                            style: const TextStyle(
                              fontFamily: "Lora",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${restaurant.price!} ${restaurant.categories!.first.title!}",
                              style: const TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomRatingBar(
                                    value:
                                        restaurant.rating?.roundToDouble() ?? 0,
                                  ),
                                  OpenClosedWidget(
                                    isOpen: restaurant.isOpen,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
