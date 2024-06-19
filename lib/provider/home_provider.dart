import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_kag/model/home/list_gudang_model.dart';
import 'package:movie_app_kag/services/api_endpoint.dart';
import 'package:movie_app_kag/services/api_services.dart';
import 'package:movie_app_kag/utilites/helper.dart';

class HomeProvider extends ChangeNotifier {
  List<ListGudangModel> listGudangModel = [];
  var loading = DataLoad.done;

  HomeProvider() {
    listGudang();
  }

  Future<void> listGudang() async {
    loading = DataLoad.loading;
    notifyListeners();

    var requestBodyMap = {
      "group_id": 9075,
    };

    try {
      var data = await ApiServices.api(
        endPoint: ApiEndpoint.listGudang,
        type: APIMethod.post,
        requestBodyMap: requestBodyMap,
        withToken: true,
      );

      if (data['code'] == '00' && data['data'] != null) {
        var dataList = data['data'] as List;
        listGudangModel =
            dataList.map((e) => ListGudangModel.fromJson(e)).toList();
        loading = DataLoad.done;
      } else {
        loading = DataLoad.failed;
      }
    } catch (e) {
      loading = DataLoad.failed;
    }

    notifyListeners();
  }
}
