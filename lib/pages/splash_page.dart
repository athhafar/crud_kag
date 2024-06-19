import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app_kag/pages/auth_page.dart';
import 'package:movie_app_kag/pages/home_page.dart';

class SplasPage extends StatefulWidget {
  const SplasPage({super.key});

  @override
  State<SplasPage> createState() => _SplasPageState();
}

class _SplasPageState extends State<SplasPage> {
  @override
  void initState() {
    super.initState();
    var duration = Duration(seconds: 3);
    Timer(
      duration,
      () async {
        final box = GetStorage();
        // box.erase();
        if (box.read('token') != null) {
          Get.to(HomePage());
        } else {
          Get.to(LoginPage());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text("text");
  }
}
