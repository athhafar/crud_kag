import 'package:flutter/material.dart';
import 'package:movie_app_kag/model/grub/member_grub_model.dart';
import 'package:movie_app_kag/services/api_endpoint.dart';
import 'package:movie_app_kag/services/api_services.dart';
import 'package:movie_app_kag/utilites/helper.dart';

class MemberGrubProvider extends ChangeNotifier {
  var loading = DataLoad.done;
  List<MemberGrubModel> listMember = [];

  MemberGrubProvider() {
    getListMember();
  }

  void getListMember() async {
    loading = DataLoad.loading;
    notifyListeners();

    var requestBodyMap = {
      "group_id": 18131,
    };
    try {
      var data = await ApiServices.api(
        endPoint: ApiEndpoint.listMember,
        type: APIMethod.post,
        requestBodyMap: requestBodyMap,
      );
      if (data['code'] == '00') {
        if (data['data'] != null) {
          var dataList = data['data'] as List;
          listMember =
              dataList.map((e) => MemberGrubModel.fromJson(e)).toList();
          loading = DataLoad.done;
        } else {
          loading = DataLoad.failed;
        }
      } else {
        loading = DataLoad.failed;
      }
    } catch (e) {
      loading = DataLoad.failed;
    }
    notifyListeners();
  }
}
