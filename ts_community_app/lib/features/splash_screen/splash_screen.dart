import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/helpers/get_storage.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/auth/views/login.dart';
import 'package:ts_community_app/features/splash_screen/root.dart';
import 'package:ts_community_app/features/auth/views/register.dart';
import 'package:ts_community_app/common/helpers/assets.dart';

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
    Timer(const Duration(seconds: 3), () => Get.off(() =>const Login()));
  }

  final introdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text('Talnts App', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
      ),
    );
  }
}
