import 'package:allpay/src/config/routers/router.dart';
import 'package:allpay/src/module/auth/local_storage/local_storage.dart';
import 'package:allpay/src/util/alert_snackbar.dart';
import 'package:allpay/src/util/api_base_herper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ValidString on String? {
  bool get invalid => this == null || this == '';
}

class ControllerSignin extends GetxController {
  ApiBaseHelper api = ApiBaseHelper();

  var isInputEmail = "".obs;
  var isPassword = "".obs;
  var isvalidate = false.obs;
  //login
  var isInputEmailLog = "".obs;
  var isPasswordLog = "".obs;
  var isvalidateLog = false.obs;
  var islength = 4.obs;
  var ischeckColor = false.obs;
  //// login App

  final isGreyEye = false.obs;
  final userName = ''.obs;
  TextEditingController emailTxtController = TextEditingController();
  TextEditingController passwordTxtController = TextEditingController();
  // TextEditingController conName = TextEditingController();

  Future<void> onlogout() async {
    await LocalStorage.storeData(key: 'access_token', value: ''); //remove Token
    router.go('/login');
  }

  final loginLoading = false.obs;

  Future<void> onLogin() async {
    if (emailTxtController.text.invalid || passwordTxtController.text.invalid) {
      alertErrorSnackbar(
          title: 'Error', message: 'Please input valid email or password');
    } else {
      loginLoading(true);
      final loginBody = {
        'email': emailTxtController.text,
        'password': passwordTxtController.text
      };
      await api
          .onNetworkRequesting(
              url: 'signin',
              methode: METHODE.post,
              isAuthorize: false,
              body: loginBody)
          .then((value) async {
        await LocalStorage.storeData(
            key: 'access_token', value: value['accessToken']);
        loginLoading(false);
        router.go('/home-router');
      }).onError((ErrorModel error, stackTrace) {
        loginLoading(false);
        alertErrorSnackbar(
            title: "Error", message: error.bodyString["message"].toString());
      });
    }
  }

  /// register App
  final isResPass = false.obs;
  TextEditingController registerFirstNameTxtController =
      TextEditingController();
  TextEditingController registerLastNameTxtController = TextEditingController();
  TextEditingController registerEmailTxtController = TextEditingController();
  TextEditingController registerPasswordTxtController = TextEditingController();

  Future<void> onRegister() async {
    final registerBody = {
      "first_name": registerFirstNameTxtController.text,
      "last_name": registerLastNameTxtController.text,
      "email": registerEmailTxtController.text.trim(),
      "password": registerPasswordTxtController.text,
    };
    await api
        .onNetworkRequesting(
            url: "signup",
            methode: METHODE.post,
            isAuthorize: false,
            body: registerBody)
        .then((respone) {
      router.go('/login');
    }).onError((ErrorModel error, stackTrace) {
      alertErrorSnackbar(
          title: "Error", message: error.bodyString["message"].toString());
    });
  }

  ///Reset Password
  final TextEditingController emailResetPasswordTxtController =
      TextEditingController();
  Future<void> onResetPassword() async {}
}
