import 'package:flutter/material.dart';
import 'package:restaurant_tour/typography.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({super.key});

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://media.es.wired.com/photos/64370c54f381a957088482cc/4:3/w_2668,h_2001,c_limit/reboot%20de%20harry%20potter%20warner.jpg',
                  height: 150.0,
                  width: 120.0,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 48,
                    width: 235,
                    child: Text(
                      'Restaurant Name Goes Here And Wrap 2 Lines',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.loraRegularTitle,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 20,
                    width: 100,
                    child: Text(
                      '\$\$\$\$ Italian',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.openRegularText,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffffb800),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffffb800),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 20,
                        width: 70,
                        child: Text(
                          'Open Now',
                          style: AppTextStyles.openRegularItalic,
                        ),
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 12.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
