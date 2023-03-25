import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/helpers/custom_svg.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/auth/controller/auth_controller.dart';
import 'package:ts_community_app/common/widgets/round_button.dart';
import 'package:ts_community_app/features/auth/views/register.dart';
import 'package:ts_community_app/features/auth/views/reset_password.dart';
import '../../../common/widgets/textform_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key,}) : super(key: key);


  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final introdata = GetStorage();

  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _authController = Get.put(AuthController);


  @override
  void initState() {
    _emailController.text = introdata.read('lastLoginEmail') ?? '';
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
              const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children:  [
                    const SizedBox(
                      height: 50,
                    ),
                    Text('Forgot Password',
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
                      height: 70,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Enter your registered email address below to reset your password',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        textAlign: TextAlign.center,),
                        const SizedBox(
                          height: 40,
                        ),
                        LabelTextFormField(
                          hintText: 'Your Email',
                          controller: _emailController,
                          validator: (value) {
                            if (value != '') {
                              return null;
                            } else {
                              return "Field cannot be empty";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RoundedButtonWidget(
                            buttonText: 'Reset',
                            width: double.infinity,
                            onpressed: () {
                               Get.to(() => const ResetPassword());
                            }),

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
                                text: 'Don\'t have an account?',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '  Sign Up',
                                      style: TextStyle(color: primaryColor,
                                          fontSize: 16))
                                ],
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

