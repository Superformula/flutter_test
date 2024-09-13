import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class NavAdapter {
  static Future<void> goToNamed(
    String path,
    BuildContext context, {
    Object? data,
  }) async {
    data ??= {};
    context.push(
      path,
      extra: data,
    );
  }

  static Future<void> push(
    Widget page,
    BuildContext context,
  ) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  static void pop(BuildContext context) {
    context.pop();
  }

  static bool canPop(BuildContext context) {
    return context.canPop();
  }
}
