import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_kag/pages/grub/add_member_grub_page.dart';
import 'package:movie_app_kag/provider/grub/member_grub_provider.dart';
import 'package:movie_app_kag/provider/grub/remove_member_grub_provider.dart';
import 'package:movie_app_kag/utilites/helper.dart';
import 'package:provider/provider.dart';

class MemberGrubPage extends StatelessWidget {
  const MemberGrubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberGrubProvider>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Text("HALAMAN GRUB"),
              InkWell(
                onTap: () {
                  Get.to(AddMemberGrubPage());
                },
                child: Text("KLIK UNTUK TAMBAH MEMBER GRUB"),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    value.loading == DataLoad.loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : value.loading == DataLoad.failed
                            ? Text("FAILED LOAD DATA")
                            : ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: value.listMember.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Provider.of<RemoveMemberGrubProvider>(
                                              context,
                                              listen: false)
                                          .removeMemberGrub(
                                        value.listMember[index].id,
                                      );
                                    },
                                    child: Text(
                                      value.listMember[index].email,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  );
                                },
                              )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
