import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app_kag/pages/home_page.dart';
// import 'package:movie_app_kag/models/me_model.dart';
import 'package:movie_app_kag/services/api_endpoint.dart';
import 'package:movie_app_kag/services/api_services.dart';
import 'package:movie_app_kag/utilites/helper.dart';
// import 'package:movie_app_kag/utilites/routes.dart';

class AuthProvider extends ChangeNotifier {
  var ctrlEmail = TextEditingController();
  var ctrlPassword = TextEditingController();
  // var meModel = MeModel().obs;

  void login(BuildContext context) async {
    Helper.loadingScreen(context);

    var requestBodyMap = {
      "email": ctrlEmail.text,
      "password": ctrlPassword.text,
      "app_slug": "pickord"
    };

    try {
      var data = await ApiServices.api(
        endPoint: ApiEndpoint.login,
        type: APIMethod.post,
        requestBodyMap: requestBodyMap,
      );

      if (data['code'] == '00') {
        Navigator.pop(context);
        Get.to(HomePage());
        final box = GetStorage();
        var token = data['data']['token'];
        box.write('token', token);

        // meModel.value = MeModel.fromJson(data['data']);
        // var token = data['data']['token'];

        // await box.write("me", jsonEncode(meModel.value));
        // await box.write("token", token);
      } else {
        Get.back();

        Get.snackbar('ERROR', data['message']);
      }
    } catch (e) {
      Get.back();
      Get.snackbar('ERROR', e.toString());

      log('ERR : ${e.toString()}');
    }
  }
}
