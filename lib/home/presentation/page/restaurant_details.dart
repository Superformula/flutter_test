import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../widgets/header.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderHome(
          text: 'Restaurant Name',
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://s3-media2.fl.yelpcdn.com/bphoto/q771KjLzI5y638leJsnJnQ/o.jpg',
              height: 360,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StarRating(rating: 3.5),
                const Text('Open Now'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            // const Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            const Text('Address'),
            const SizedBox(
              height: 16,
            ),
            const Text('102 Lakerside Ave'),
            const Text('Seattle, WA 98122'),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Overall Rating'),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Text('4.6'),
                Icon(
                  Icons.star,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('42 reviews'),
            const SizedBox(
              height: 16,
            ),
            StarRating(rating: 3.5),
            const Text('Open Now'),
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://s3-media2.fl.yelpcdn.com/photo/rEWek1sYL0F35KZ0zRt3sw/o.jpg',
                  ),
                  radius: 24,
                ),
                Text('Helder'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
