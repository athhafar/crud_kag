import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_kag/provider/grub/member_grub_provider.dart';
import 'package:movie_app_kag/services/api_endpoint.dart';
import 'package:movie_app_kag/services/api_services.dart';
import 'package:movie_app_kag/utilites/helper.dart';
import 'package:provider/provider.dart';

class AddMemberGrubProvider extends ChangeNotifier {
  var ctrlEmail = TextEditingController();

  void addMemberGrub(BuildContext context) async {
    // Helper.loadingScreen();
    var requestBodyMap = {
      "group_id": 18131,
      "email": ctrlEmail.text,
    };

    try {
      var data = await ApiServices.api(
        endPoint: ApiEndpoint.addMember,
        type: APIMethod.post,
        requestBodyMap: requestBodyMap,
      );
      if (data['code'] == '00') {
        Get.close(1);
        Get.snackbar('SUCCESS', data['message']);
        Provider.of<MemberGrubProvider>(context, listen: false).getListMember();
      } else {
        Get.close(2);
        Get.snackbar('FAILED', data['message']);
      }
    } catch (e) {
      Get.snackbar('FAILED', e.toString());
    }
  }
}
