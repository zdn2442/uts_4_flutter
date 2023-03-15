import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../controllers/siswa_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/add_siswa_controller.dart';

class AddSiswaView extends GetView<AddSiswaController> {
  final siswaC = Get.put(SiswaController());
  final controller = Get.put(AddSiswaController());
  final tanggal = Get.put(Tanggal());

  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman tambah siswa'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: tinggi * 0.84,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Tambah Siswa",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w500),
                      ),
                      // Icon(
                      //   Icons.waving_hand_rounded,
                      //   color: Color.fromARGB(255, 221, 199, 0),
                      //   size: 30,
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Hello again, you`ve been missed!",
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           // fontWeight: FontWeight.w300,
                  //           color: Color.fromARGB(117, 23, 23, 52)),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Masukan NISN",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: controller.nisn,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.numbers),
                          labelText: "Masukan nisn",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(117, 23, 23, 52)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Color(0xff3B9AE1)))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Masukan Nama Siswa",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: controller.nama,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle_sharp),
                          labelText: "Masukan nama",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(117, 23, 23, 52)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Color(0xff3B9AE1)))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Masukan Tanggal Lahir",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: controller.tanggalLahir,
                      readOnly: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range_outlined),
                          labelText: "Masukan tanggal lahir",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(117, 23, 23, 52)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Color(0xff3B9AE1)))),
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: tanggal.selectedDate.value,
                                firstDate: DateTime(1980),
                                lastDate: DateTime(2030),
                              ).then((newDate) {
                                if (newDate != null) {
                                  tanggal.onDateSelected(newDate);
                                  controller.tanggalLahir.text =
                                      tanggal.selectedDate.value.toString();
                                }
                              });
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Masukan Tempat Lahir",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: controller.tempatLahir,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                          labelText: "Masukan tempat lahir",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(117, 23, 23, 52)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Color(0xff3B9AE1)))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Masukan Alamat",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: controller.alamat,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.place),
                          labelText: "Masukan alamat",
                          labelStyle:
                              TextStyle(color: Color.fromARGB(117, 23, 23, 52)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Color(0xff3B9AE1)))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Masukan Gambar",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: controller.gambar,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.image),
                          labelText: controller.tulisan.string,
                          labelStyle:
                              TextStyle(color: Color.fromARGB(117, 23, 23, 52)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: Color(0xff3B9AE1)))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              width: lebar,
              height: tinggi * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  siswaC.addData(
                      int.parse(controller.nisn.text),
                      controller.nama.text,
                      controller.tanggalLahir.text,
                      controller.tempatLahir.text,
                      controller.alamat.text,
                      controller.gambar.text);
                },
                // onPressed: () => print('pressed'),
                child: Text(
                  "Tambah",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 24, 150, 208)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tanggal extends GetxController {
  var selectedDate = DateTime.now().obs;

  void onDateSelected(DateTime newDate) {
    selectedDate.value = newDate;
  }
}
