part of '../restaurant_tour_page.dart';

class _AppBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController _tabController;

  const _AppBar(this._tabController) : preferredSize = const Size.fromHeight(kToolbarHeight + 32);

  @override
  final Size preferredSize;

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<_AppBar> {
  void _onTabBarTapped(int index) {
    widget._tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('RestauranTour', style: AppTextStyles.loraRegularHeadline),
      centerTitle: true,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Material(
          elevation: 3,
          color: Colors.white,
          shadowColor: Colors.black.withOpacity(0.4),
          child: TabBar(
            controller: widget._tabController,
            onTap: _onTabBarTapped,
            tabAlignment: TabAlignment.center,
            splashFactory: NoSplash.splashFactory,
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            indicatorColor: Colors.black,
            labelStyle: AppTextStyles.openRegularTitleSemiBold,
            isScrollable: true,
            unselectedLabelStyle: AppTextStyles.openRegularTitleSemiBold.copyWith(color: const Color(0xFF606060)),
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.black,
              ),
              insets: EdgeInsets.symmetric(horizontal: 0),
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 12),
            tabs: const [
              Tab(text: 'All Restaurants'),
              Tab(text: 'My Favorites'),
            ],
          ),
        ),
      ),
    );
  }
}
