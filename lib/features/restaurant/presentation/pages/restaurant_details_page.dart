import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_tour/features/restaurant/data/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_cubit.dart';
import 'package:restaurant_tour/features/restaurant/presentation/widgets/custom_rating_bar.dart';
import 'package:restaurant_tour/features/restaurant/presentation/widgets/open_closed_widget.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  late bool favorite;

  @override
  void initState() {
    favorite = widget.restaurant.favorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.restaurant.name ?? "Name not found!",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: "Lora",
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final cubit = context.read<HomeCubit>();
              cubit.markFavorite(widget.restaurant.id!);

              setState(() {
                favorite = !favorite;
              });
            },
            icon: SvgPicture.asset(
              favorite
                  ? "assets/icons/heart_filled.svg"
                  : "assets/icons/heart_empty.svg",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: ValueKey(widget.restaurant.id!),
              child: CachedNetworkImage(
                // height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fitWidth,
                imageUrl: widget.restaurant.photos!.first,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OpenClosedWidget(
                    isOpen: widget.restaurant.isOpen,
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Color(0xffEEEEEE),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Address",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.restaurant.location?.formattedAddress ??
                        'Not found!',
                    style: const TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Color(0xffEEEEEE),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Overall Rating",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.restaurant.rating.toString(),
                        style: const TextStyle(
                          fontFamily: "Lora",
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const RatingStars(
                        starCount: 1,
                        starColor: Color(0xffFFB800),
                        starOffColor: Colors.transparent,
                        starSize: 12,
                        value: 10,
                        maxValueVisibility: false,
                        valueLabelVisibility: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Color(0xffEEEEEE),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "${widget.restaurant.reviews?.length ?? '0'} Reviews",
                    style: const TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (widget.restaurant.reviews != null &&
                      widget.restaurant.reviews!.isNotEmpty) ...[
                    for (final review in widget.restaurant.reviews!) ...[
                      CustomRatingBar(
                        value: review.rating?.roundToDouble() ?? 0,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "${review.text}",
                        style: const TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: CachedNetworkImage(
                              imageUrl: review.user?.imageUrl ??
                                  "https://pixabay.com/illustrations/user-icon-icono-de-usuario-pictogram-2098873/",
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
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
                          const SizedBox(width: 16),
                          Text(
                            review.user?.name ?? "Not Found!",
                            style: const TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
