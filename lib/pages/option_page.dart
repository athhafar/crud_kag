import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_kag/pages/grub/member_grub_page.dart';
import 'package:movie_app_kag/pages/home_page.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.to(MemberGrubPage());
              },
              child: Text('GRUB'),
            ),
            const SizedBox(
              height: 32.0,
            ),
            InkWell(
              onTap: () {
                Get.to(HomePage());
              },
              child: Text("WAREHOUSE"),
            ),
          ],
        ),
      ),
    );
  }
}
