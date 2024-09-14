import 'package:flutter/material.dart';

import '../../../typography.dart';
import '../../widgets/widgets.dart';

part 'widgets/arrow_back_icon.dart';
part 'widgets/divider.dart';
part 'widgets/favorite_icon.dart';
part 'widgets/rating.dart';
part 'widgets/review_item.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const _ArrowBackIcon(),
        actions: [
          _FavoriteIcon(
            onFavorite: () {},
          ),
        ],
        title: const Text(
          'Restaurant Name Goes Here And Wraps 2 Lines',
          style: AppTextStyles.loraRegularHeadline,
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 360,
            color: Colors.red,
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$\$\$\$ Italian', style: AppTextStyles.openRegularText),
                    Status(true),
                  ],
                ),
                _Divider(),
                Text('Address', style: AppTextStyles.openRegularText),
                SizedBox(height: 24),
                Text('102 Lakeside Ave\nSeattle, WA 98122', style: AppTextStyles.openRegularTitleSemiBold),
                _Divider(),
                Text('Overall Rating', style: AppTextStyles.openRegularText),
                SizedBox(height: 16),
                _Rating(),
                _Divider(),
                Text('42 reviews', style: AppTextStyles.openRegularText),
                SizedBox(height: 16),
                _ReviewItem(),
                _ReviewItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
