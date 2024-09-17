import 'package:flutter/material.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/ui/foundations/typography.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';

///Widget that containt the home AppBar
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const HomeAppBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(AppConstants.appName, style: AppTextStyles.loraRegularTitle),
      elevation: 4,
      surfaceTintColor: OsColors.light,
      shadowColor: OsColors.secondaryColor.withOpacity(0.4),
      backgroundColor: OsColors.light,
      bottom: TabBar(
        controller: tabController,
        tabs: const [
          Tab(text: AppConstants.allRestaurants),
          Tab(text: AppConstants.myFavorites),
        ],
        labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        indicatorColor: OsColors.bodyTextColor,
        labelColor: OsColors.bodyTextColor,
        dividerColor: Colors.transparent,
        labelStyle: AppTextStyles.openRegularLightSemiBold,
        indicatorSize: TabBarIndicatorSize.label,
        tabAlignment: TabAlignment.center,
        unselectedLabelStyle: AppTextStyles.openRegularLightSemiBold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + kTextTabBarHeight + 10);
}
