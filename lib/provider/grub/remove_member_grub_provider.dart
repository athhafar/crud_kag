import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_kag/provider/grub/add_member_grub_provider.dart';
import 'package:movie_app_kag/services/api_endpoint.dart';
import 'package:movie_app_kag/services/api_services.dart';
import 'package:provider/provider.dart';

class RemoveMemberGrubProvider extends ChangeNotifier {
  void removeMemberGrub(id) async {
    var requestBodyMap = {
      "id": id,
      "group_id": 18131,
    };

    try {
      var data = await ApiServices.api(
        endPoint: ApiEndpoint.removeMemberGrub,
        type: APIMethod.post,
        requestBodyMap: requestBodyMap,
      );
      if (data['code'] == '00') {
        Get.close(2);
        Get.snackbar('SUCESS', data['messages']);
      } else {
        Get.close(2);
        Get.snackbar('FAILED', data['messages']);
      }
    } catch (e) {
      Get.snackbar('FAILED', e.toString());
    }
  }
}
