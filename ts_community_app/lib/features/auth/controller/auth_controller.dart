
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/helpers/utils.dart';
import 'package:ts_community_app/common/network/base_client.dart';
import 'package:ts_community_app/common/network/base_controller.dart';
import 'package:ts_community_app/common/widgets/bottom_navbar.dart';
import 'package:ts_community_app/features/auth/model/registration_model.dart';
import 'package:ts_community_app/features/auth/services/auth_service.dart';
import 'package:ts_community_app/features/auth/views/email_successful.dart';
import 'package:ts_community_app/features/auth/views/otp_screen.dart';
import 'package:ts_community_app/features/auth/views/otp_screen.dart';
import 'package:ts_community_app/features/auth/views/password_sent.dart';
import 'package:ts_community_app/features/auth/views/reset_successful.dart';
import 'package:ts_community_app/features/auth/views/verify_email.dart';
import 'package:ts_community_app/features/community/views/communities.dart';

import '../views/login.dart';

class AuthController extends GetxController with BaseController {
  String? pubspecPackageName = 'ts_community_app';
  final AuthService _authService = AuthService();

  var isLoading = false.obs;
  var isSuccess = false.obs;
  final introdata = GetStorage();

  void login({required String email, required String password}) {
    isLoading(true);
    _authService.login(email, password).then((value) {
      introdata.write('access', value['data']['access']);
      introdata.write('user_id', value['data']['user']['user_id']);
      if (value['status'] == true) {
        Get.off(() => const BottomBar());
      }
    }).catchError((e) {
      isLoading(false);
      print(e);
      handleError(e);
    });
  }

  void forgotPassword({required String email}) {
    isLoading(true);
    _authService.forgotPassword(email).then((value) {
      if (value['status'] == true) {
        isLoading(false);
        Get.to(() => PasswordResetOtpScreen(emailAddress: email));
      }
    }).catchError((e) {
      isLoading(false);
      print(e);
      handleError(e);
    });
  }

  void resendOtp(String email) {
    print(email);
    _authService.resendOtp(email).then((value) {
      print('success');
    }).catchError((e) {
      print(e);
      showSnackBar(content: e);
    });
  }

  void resetPassword(String email, String password, int otpCode){
    isLoading(true);
    _authService.resetPassword(email, password, otpCode).then((value){
      isLoading(false);
      if(value['status'] == true) {
        Get.to(()=> const ResetSuccessful());
      }

    }).catchError((e) {
      isLoading(false);
      print(e);
      handleError(e);
    });
  }


  void verifyEmail(String email, int otpCode){
    isLoading(true);
    _authService.verifyEmail(email,otpCode).then((value){
      isLoading(false);
      if(value['status'] == true) {
        Get.to(()=> const EmailSuccessful());
      }

    }).catchError((e) {
      isLoading(false);
      print(e);
      handleError(e);
    });
  }

  void register(
      {required String firstName,
      required String lastName,
      required String emailAddress,
      required String username,
      required String password}) {
    isLoading(true);
    _authService
        .signUp(firstName, lastName, emailAddress, username, password)
        .then((value) {
      if (value['status'] == true) {
        Get.to(() =>  VerifyEmail(emailAddress: emailAddress));
      }
    }).catchError((e) {
      isLoading(false);
      print(e);
      handleError(e);
    });
  }

  void logOut() {
    Get.offAll(() => const Login());
    introdata.remove('access');

  }
}
