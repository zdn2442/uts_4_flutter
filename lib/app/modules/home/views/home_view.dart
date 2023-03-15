import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_4_flutter/app/controllers/auth_controller.dart';
import 'package:uts_4_flutter/app/controllers/siswa_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.put(AuthController());
  final siswaC = Get.put(SiswaController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: tinggi * 0.99,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(color: Color(0xff3B9AE1)),
                padding: EdgeInsets.only(top: 25),
                child: Center(
                  child: Text(
                    'Data Siswa',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              FutureBuilder<QuerySnapshot<Object?>>(
                future: siswaC.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var listData = snapshot.data!.docs;
                    return Container(
                        child: Column(
                            children: List.generate(listData.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(top: 25, bottom: 5),
                        width: lebar * 0.95,
                        height: tinggi * 0.15,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xff3B9AE1), width: 3),
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              // color: Colors.red,
                              width: 155,
                              height: 155,
                              child: Image.network((listData[index].data()
                                  as Map<String, dynamic>)["linkFoto"]),
                            ),
                            Container(
                              width: 185,
                              height: tinggi * 4,
                              // color: Colors.red,
                              margin: EdgeInsets.only(top: 10, left: 4),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 30, bottom: 20),
                                        child: Text(
                                          (listData[index].data() as Map<String,
                                              dynamic>)["namaSiswa"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: 15, bottom: 5),
                                          child: Text((listData[index].data()
                                                      as Map<String, dynamic>)[
                                                  "nisn"]
                                              .toString())),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text((listData[index]
                                                          .data()
                                                      as Map<String, dynamic>)[
                                                  "tanggalLahir"]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text((listData[index].data()
                                                as Map<String, dynamic>)[
                                            "tempatLahir"]),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 34),
                                        child: Text((listData[index].data()
                                            as Map<String, dynamic>)["alamat"]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Actionbutton(
                              arguments: listData[index],
                              delete: (listData[index].id)
                            )
                          ],
                        ),
                      );
                    })));
                  } else {
                    return SizedBox();
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () => authC.logout(),
                  child: Text('Klik untuk logout'))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_SISWA),
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget Actionbutton({arguments, delete}) {
  final siswaC = Get.put(SiswaController());
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
    // color: Colors.blue,
    child: Column(
      children: [
        Container(
          child: ElevatedButton(
              onPressed: () =>
                  Get.toNamed(Routes.EDIT_SISWA, arguments: arguments),
              child: Text('Edit')),
        ),
        Container(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Get.defaultDialog(
                  title: "Really Want To Delete It?",
                  middleText: 'are youe sure want to delete this data?',
                  confirm: ElevatedButton(
                      onPressed: () {
                        siswaC.deleteData(delete);
                        Get.offAndToNamed(Routes.HOME);
                      },
                      child: Text('Yes')),
                  cancel: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => Get.back(),
                      child: Text('No'))),
              child: Text('Hapus')),
        )
      ],
    ),
  );
}
