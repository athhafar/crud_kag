import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_kag/provider/home_provider.dart';
import 'package:movie_app_kag/services/api_endpoint.dart';
import 'package:movie_app_kag/services/api_services.dart';
import 'package:movie_app_kag/utilites/helper.dart';
import 'package:provider/provider.dart';

class TambahGudangProvider extends ChangeNotifier {
  var ctrlNameGudang = TextEditingController();
  var ctrlAlamatGudang = TextEditingController();

  void addNewGudang(BuildContext context) async {
    Helper.loadingScreen(context);

    var requestBodyMap = {
      "id": 0,
      "group_id": 9075,
      "name": ctrlNameGudang.text,
      "address": ctrlAlamatGudang.text
    };

    var data = await ApiServices.api(
        endPoint: ApiEndpoint.addGudang,
        type: APIMethod.post,
        requestBodyMap: requestBodyMap);
    if (data['code'] == '00') {
      Get.close(2);
      Get.snackbar('SUCCESS', data['message']);
      context.read<HomeProvider>().listGudang();
    } else {
      Get.back();
      Get.snackbar('FAILED', data['message']);
    }
    notifyListeners();
  }
}
