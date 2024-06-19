import 'package:flutter/material.dart';
import 'package:movie_app_kag/provider/home_provider.dart';
import 'package:movie_app_kag/provider/tambah_gudang_provider.dart';
import 'package:provider/provider.dart';

class TambahGudangPage extends StatelessWidget {
  const TambahGudangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TambahGudangProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Text("text"),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "group",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  // TextFormField(
                  //   controller: grubController.ctrlNameGrub.value,
                  //   textInputAction: TextInputAction.next,
                  //   keyboardType: TextInputType.name,
                  //   textCapitalization: TextCapitalization.words,
                  //   onChanged: (value) {},
                  //   decoration: kDecorationForm.copyWith(
                  //     fillColor: BaseColor.lightGrey,
                  //   ),
                  //   enabled: false,
                  // ),
                  Text(
                    "warehouse_name",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: value.ctrlNameGudang,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) {},
                    // decoration: kDecorationForm.copyWith(
                    //   fillColor: BaseColor.lightGrey,
                    // ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "warehouse_address",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: value.ctrlAlamatGudang,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) {},
                    maxLines: null,
                    minLines: 6,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextButton(
                    onPressed: () {
                      value.addNewGudang(context);
                    },
                    child: Text("text"),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
