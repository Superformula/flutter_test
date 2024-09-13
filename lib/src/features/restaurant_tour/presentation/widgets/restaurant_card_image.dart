import 'package:flutter/material.dart';

class RestaurantCardImage extends StatelessWidget {
  const RestaurantCardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        'https://media.es.wired.com/photos/64370c54f381a957088482cc/4:3/w_2668,h_2001,c_limit/reboot%20de%20harry%20potter%20warner.jpg',
        height: 120.0,
        width: 120.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
