import 'dart:async';

import 'package:dashboard/src/pages/controlle_page.dart';

import './../core/extensions/extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String name = "Splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _timer = Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          ContollePage.name,
          (route) => false,
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenSize(context).height,
        width: screenSize(context).width,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Constant.primaryColor.withOpacity(0.5),
                  BlendMode.darken,
                ),
                image: AssetImage(Constant.splashImage),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "App Name",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
