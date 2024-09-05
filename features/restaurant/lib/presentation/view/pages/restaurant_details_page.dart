import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/presentation/presenters/restaurant_details_presenter.dart';
import 'package:restaurant/presentation/routes/params/route_details_params.dart';
import 'package:restaurant/presentation/view/widgets/cards/review_card.dart';
import 'package:restaurant/presentation/view/widgets/details_areas.dart';
import 'package:shimmer/shimmer.dart';
import 'package:state_management/presentation/sf_state.dart';
import 'package:ui_kit/presentation/font_style/typography.dart';
import 'package:ui_kit/ui_kit.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({
    super.key,
  });

  Widget getIcon(SFState state) {
    switch (state) {
      case SFSuccessState<bool>():
        return Icon(
          state.object ? Icons.favorite : Icons.favorite_border_outlined,
          color: state.object ? Colors.black : null,
        );
      default:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade100,
          child: const Icon(Icons.favorite_border_outlined),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    RouteDetailsParams routeDetailsParams =
        ModalRoute.of(context)!.settings.arguments as RouteDetailsParams;

    return BlocProvider<RestaurantDetailsPresenter>(
      create: (context) =>
          RestaurantDetailsPresenter(routeDetailsParams.restaurant.isFavorite)
            ..isRestaurantFavorite(routeDetailsParams.restaurant),
      child: Builder(builder: (context) {
        var presenter = context.read<RestaurantDetailsPresenter>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              routeDetailsParams.restaurant.name,
              style: Theme.of(context).textTheme.headlineMedium,
              overflow: TextOverflow.ellipsis,
            ),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(
                    routeDetailsParams.mustRefreshWhenPop
                        ? presenter.mustRefresh()
                        : false),
                icon: const Icon(Icons.arrow_back)),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: BlocBuilder<RestaurantDetailsPresenter, SFState>(
                    builder: (context, state) {
                      return IconButton(
                          onPressed: () {
                            context
                                .read<RestaurantDetailsPresenter>()
                                .heartPressed(routeDetailsParams.restaurant);
                          },
                          icon: getIcon(state));
                    },
                  ))
            ],
          ),
          body: ListView(
            children: [
              Hero(
                tag: 'network:image',
                child: CachedNetworkImage(
                  imageUrl: "https://picsum.photos/250?image=9",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox(
                      width: 80,
                      height: 80,
                      child: Center(
                        child: CircularProgressIndicator(),
                      )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///TODO Add title to model
                        Text(
                          "${routeDetailsParams.restaurant.price} ${routeDetailsParams.restaurant.categories?.first.title ?? ''}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              routeDetailsParams.restaurant.status,
                              style: AppTextStyles.openRegularItalic,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.circle,
                              color: routeDetailsParams.restaurant.statusColor,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DetailsArea(
                      title: "Address",
                      content: Text(
                          routeDetailsParams
                              .restaurant.location.formattedAddress,
                          style: AppTextStyles.openRegularTitleSemiBold),
                    ),
                    DetailsArea(
                      title: "Overall Rating",
                      content: Row(
                        children: [
                          Text(routeDetailsParams.restaurant.rating.toString(),
                              style: AppTextStyles.loraLargeTitleSemiBold),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.star,
                          )
                        ],
                      ),
                    ),
                    Text(
                      "${routeDetailsParams.restaurant.reviews.length} Reviews",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: routeDetailsParams.restaurant.reviews.length,
                        itemBuilder: (context, index) {
                          var review =
                              routeDetailsParams.restaurant.reviews[index];
                          return ReviewCard(review: review);
                        })
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
