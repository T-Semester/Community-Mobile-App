import 'package:flutter/material.dart';
import 'package:ts_community_app/common/helpers/custom_svg.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/common/helpers/assets.dart';
import 'package:get/get.dart';
import 'package:ts_community_app/features/auth/controller/auth_controller.dart';


class ResetSuccessful extends StatelessWidget {
  const ResetSuccessful({
    Key? key,
  }) : super(key: key);

 // final _authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomSvg(assetName: successSvg,
                  height: 200,
                  width: 200,),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Password Reset Successfully!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  'Continue to Login',
                  style: TextStyle(
                    fontSize: 14, 
                    color: primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}