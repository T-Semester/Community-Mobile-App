import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/helpers/get_storage.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/auth/views/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts_community_app/features/splash_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    LocalStorage().init();
    Timer(const Duration(seconds: 5), () => Get.off(() => const OnboardingScreen()));
  }

  final introdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    // replace with your logo image asset path
                    width: 200,
                    height: 100,
                  ),
                  Text(
                    'Talnts App',
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
