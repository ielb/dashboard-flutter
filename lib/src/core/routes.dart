import 'package:dashboard/src/pages/alert_form_page.dart';
import 'package:dashboard/src/pages/controlle_page.dart';
import 'package:dashboard/src/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  Routes._();
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.name:
        return CupertinoPageRoute(
            builder: (_) => const SplashPage(), settings: settings);

      case ContollePage.name:
        return CupertinoPageRoute(
            builder: (_) => const ContollePage(), settings: settings);

      case CreateAlertPage.name:
        return CupertinoPageRoute(
            builder: (_) => const CreateAlertPage(), settings: settings);
      default:
        return CupertinoPageRoute(
            builder: (_) => const SplashPage(), settings: settings);
    }
  }
}
