part of '../restaurant_tour_page.dart';

void showSnackBar(BuildContext context, {required RestaurantErrorState state}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 2000),
      content: Text(
        state.message,
        style: AppTextStyles.openRegularHeadline.copyWith(
          color: Colors.white,
        ),
      ),
    ),
  );
}
