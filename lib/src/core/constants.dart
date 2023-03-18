import 'package:dashboard/src/core/extensions/extensions.dart';

class Constant {
  static final Constant _instance = Constant._internal();
  factory Constant() => _instance;
  Constant._internal();

  // Path: lib\src\core\constants.dart

  static String splashImage = "assets/splash.png";
  static String dashboardIcon = "assets/dashboard.png";
  static String observationIcon = "assets/observationIcon.png";
  static String reportsIcon = "assets/report.png";

  static Color primaryColor = const Color(0xFF2E166A);
}
