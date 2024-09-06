import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:restaurant_tour/core/utils/app_keys.dart';
import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_cubit.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_state.dart';

class ListRestaurants extends StatelessWidget {
  const ListRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    cubit.getRestaurants();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (c, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(
              key: Key(AppKeys.loadingRestaurantsIndicator),
              color: Colors.black,
            ),
          );
        } else if (state is HomeLoaded) {
          return ListView.builder(
            key: const Key(AppKeys.listRestaurantsFetched),
            padding: const EdgeInsets.all(12),
            itemCount: state.restaurants.length,
            itemBuilder: (c, i) {
              final Restaurant restaurant = state.restaurants[i];
              return Container(
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
                                      RatingStars(
                                        starSize: 12.0,
                                        maxValueVisibility: false,
                                        valueLabelVisibility: false,
                                        value: restaurant.rating
                                                ?.roundToDouble() ??
                                            0,
                                        starColor: const Color(0xffFFB800),
                                        starOffColor: Colors.transparent,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            restaurant.isOpen
                                                ? "Open Now"
                                                : "Closed",
                                            style: const TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Center(
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                right: 8,
                                              ),
                                              height: 8,
                                              width: 8,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: restaurant.isOpen
                                                    ? const Color(0xff5CD313)
                                                    : const Color(0xffEA5E5E),
                                              ),
                                            ),
                                          ),
                                        ],
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
              );
            },
          );
        }
        return const Text(
          "Error when fetching restaurants! Please, try again!",
          key: Key(AppKeys.listRestaurantsError),
        );
      },
    );
  }
}
