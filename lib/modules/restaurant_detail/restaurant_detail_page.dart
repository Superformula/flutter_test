import 'package:flutter/material.dart';

import 'package:restaurant_tour/modules/home/widgets/image_network_loading.dart';
import 'package:restaurant_tour/modules/restaurant_detail/widgets/review_list.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre del restaurante'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: double.infinity,
              color: Colors.grey,
              child: const ImageNetworkLoading(),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$500 Italian'),
                      Row(
                        children: [
                          Text('Open now'),
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  Text('Address'),
                  Text('102 Lakeside Ave'),
                  Text('Seattle, WA 98122'),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  Text('Overral Rating'),
                  Text('4.6'),
                  SizedBox(height: 16),
                  Divider(),
                  Text('42 reviews'),
                  ReviewList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
