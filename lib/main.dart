import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app_kag/pages/auth_page.dart';
import 'package:movie_app_kag/pages/home_page.dart';
import 'package:movie_app_kag/pages/option_page.dart';
import 'package:movie_app_kag/pages/splash_page.dart';
import 'package:movie_app_kag/provider/grub/add_member_grub_provider.dart';
import 'package:movie_app_kag/provider/grub/member_grub_provider.dart';
import 'package:movie_app_kag/provider/grub/remove_member_grub_provider.dart';
import 'package:movie_app_kag/provider/home_provider.dart';
import 'package:movie_app_kag/provider/tambah_gudang_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TambahGudangProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MemberGrubProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddMemberGrubProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RemoveMemberGrubProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: OptionPage(),
      ),
    );
  }
}
