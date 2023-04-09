import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/auth/views/login.dart';
import 'package:ts_community_app/common/widgets/round_button.dart';
import 'package:ts_community_app/features/auth/views/register.dart';
import 'package:ts_community_app/features/auth/controller/auth_controller.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key,}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final introdata = GetStorage();
  final TextEditingController _emailController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    //_emailController.text = introdata.read('lastLoginEmail') ?? '';
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Verify Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: primaryColor,
                      fontWeight: FontWeight.bold,),),
                  const SizedBox(
                    height: 3,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 80,
                      color: primaryColor,
                      height: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/email_inbox.png'),
                  const SizedBox(
                    height: 10,
                  ),
                   const Text('A mail has been sent to your email address.\n'
                       'Click on the link in the mail to verify your email',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Resend Mail',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: floatingActionButtonColor,
                      fontWeight: FontWeight.bold,),),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.to(() =>const Register());
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Not your email address?',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Change Email',
                                style: TextStyle(color: floatingActionButtonColor,
                                    fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButtonWidget(
                      buttonText: 'Login',
                      width: double.infinity,
                      onpressed: (){
                        Get.offAll(() => const Login());
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

