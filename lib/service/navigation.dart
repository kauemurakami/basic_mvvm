import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget) {
    return navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
  }

  navigateReplace(Widget widget) {
    return navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  Future<void> showDialog(/*BuildContext? context,*/ Widget widget) async {
    await showAdaptiveDialog(
      barrierDismissible: true,
      context: /*context ??*/ navigatorKey.currentContext!,
      builder: (context) => widget,
    );
  }

  //add text and function action
  void showSnackbar(String message) {
    final context = navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    final SnackBar snackBarWidget = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBarWidget);
  }
}
