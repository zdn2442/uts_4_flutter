import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SiswaController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference siswa = firestore.collection("siswa");
    try {
      await siswa.get().then((event) {
        for (var doc in event.docs) {
         print("data get :)");
        }
        return event;
      });
    } catch (e) {
      print(e);
      Get.defaultDialog(title: "Error", middleText: 'Failed to get data');
    }
    return await siswa.get();
  }

  deleteData(String id)async{
    try {
      DocumentReference siswa = firestore.collection('siswa').doc(id);
      await siswa.delete();
      Get.defaultDialog(
              title: "Data Deleted :)",
              middleText: 'data delete success, now you won\'t meet with him again ');
    } catch (e) {
      print(e);
      Get.defaultDialog(title: "Error", middleText: 'Failed to delete data');
    }
  }

  addData(int nisn, String namaSiswa, String tanggalLahir, String tempatLahir, String alamat, String linkFoto)async {
    CollectionReference siswa = firestore.collection("siswa");
    final dataSiswa = {
      "nisn": nisn,
      "namaSiswa": namaSiswa,
      "tanggalLahir": tanggalLahir,
      "tempatLahir": tempatLahir,
      "alamat": alamat,
      "linkFoto": linkFoto,
    };

// Add a new document with a generated ID
    try {
      await siswa.add(dataSiswa).then((DocumentReference doc) =>
          Get.defaultDialog(
              title: "Data Uploaded :)",
              middleText: 'DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      print(e);
      Get.defaultDialog(title: "Error", middleText: 'Failed to add data');
    }
  }

  updateData(String id, int nisn, String namaSiswa, String tanggalLahir, String tempatLahir, String alamat, String linkFoto)async{
    final dataSiswa = {
      "nisn": nisn,
      "namaSiswa": namaSiswa,
      "tanggalLahir": tanggalLahir,
      "tempatLahir": tempatLahir,
      "alamat": alamat,
      "linkFoto": linkFoto,
    };
    try {  
      DocumentReference siswa = firestore.collection('siswa').doc(id);
      await siswa.update(dataSiswa);
      Get.defaultDialog(
              title: "Data Updated :)",
              middleText: 'data update success');
    } catch (e) {
      print(e);
      Get.defaultDialog(title: "Error", middleText: 'Failed to update data');
    }
  }
}
