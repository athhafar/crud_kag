import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_kag/pages/tambah_gudang_page.dart';
import 'package:movie_app_kag/provider/home_provider.dart';
import 'package:movie_app_kag/utilites/helper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final settingProvider = context.read<HomeProvider>();
    return Consumer<HomeProvider>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: IconButton(
            onPressed: () {
              Get.to(TambahGudangPage());
            },
            icon: Icon(Icons.abc)),
        body: Column(
          children: [
            const Text(
              "text",
              style: TextStyle(
                fontSize: 100.0,
              ),
            ),
            Expanded(
              child: value.loading == DataLoad.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : value.loading == DataLoad.failed
                      ? const Center(
                          child: Text("Failed to load data"),
                        )
                      : SingleChildScrollView(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: value.listGudangModel.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  value.listGudangModel[index].name,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 43,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
