import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static Future<String> readJson() async {
    String response =
        await rootBundle.loadString('assets/json/graphql_response.json');
    return response;
  }

  static ImageProvider? getImageProvider(String avatar) {
    final defaultImage = Image.asset(
      'assets/images/user.png',
    ).image;

    final avatarUrl = Uri.parse(avatar);

    if (!avatarUrl.hasAbsolutePath) {
      return defaultImage;
    }

    return avatar != '' ? NetworkImage(avatar) : defaultImage;
  }
}
