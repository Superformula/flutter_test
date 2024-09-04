import 'package:flutter/material.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/view/widgets/details_areas.dart';
import 'package:restaurant/presentation/view/widgets/rating_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_kit/presentation/font_style/typography.dart';
import 'package:ui_kit/ui_kit.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Restaurant restaurant =
        ModalRoute.of(context)!.settings.arguments as Restaurant;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          restaurant.name,
          style: Theme.of(context).textTheme.headlineMedium,
          overflow: TextOverflow.ellipsis,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.favorite_border_outlined),
          )
        ],
      ),
      body: ListView(
        children: [
          Hero(
            tag: 'network:image',
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: "https://picsum.photos/250?image=9",
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.45,
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
                      "${restaurant.price} ${restaurant.categories?.first.title ?? ''}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          restaurant.status,
                          style: AppTextStyles.openRegularItalic,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.circle,
                          color: restaurant.statusColor,
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
                  content: Text(restaurant.location.formattedAddress,
                      style: AppTextStyles.openRegularTitleSemiBold),
                ),
                DetailsArea(
                  title: "Overall Rating",
                  content: Row(
                    children: [
                      Text(restaurant.rating.toString(),
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
                  "${restaurant.reviews.length} Reviews",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: restaurant.reviews.length,
                    itemBuilder: (context, index) {
                      var review = restaurant.reviews[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingWidget(rate: review.rating.toDouble()),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            review.text ?? "",
                            style: AppTextStyles.openRegularHeadline,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              ClipOval(
                                child: review.user.imageUrl == null
                                    ? Container(
                                        color: Colors.red.withOpacity(0.2),
                                        width: 40.0,
                                        height: 40.0,
                                        child: Center(
                                          child: Text(review.user.name.initials,
                                              style: AppTextStyles
                                                  .openRegularText),
                                        ),
                                      )
                                    : Image.network(
                                        review.user.imageUrl!,
                                        fit: BoxFit.cover,
                                        width: 40.0,
                                        height: 40.0,
                                      ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(review.user.name.fullName)
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
