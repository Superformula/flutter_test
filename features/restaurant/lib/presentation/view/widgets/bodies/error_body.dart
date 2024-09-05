import 'package:flutter/material.dart';
import 'package:ui_kit/presentation/font_style/typography.dart';
import 'package:ui_kit/ui_kit.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    super.key,
    required this.reloadFunction,
  });

  final Function reloadFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Oops, something went wrong",
          style: AppTextStyles.openRegularText,
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () => reloadFunction(),
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateColor.resolveWith((states) => AppColors.red)),
            child: Text(
              "Try Again",
              style:
                  AppTextStyles.openRegularText.copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
