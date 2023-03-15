import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_4_flutter/app/controllers/auth_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/for_pass_controller.dart';

class ForPassView extends GetView<ForPassController> {
  final controller = Get.put(ForPassController());
  final authC = Get.put(AuthController());

  @override
   Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: tinggi * 0.84,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(Routes.LOGIN),
                        child: Icon(
                          Icons.arrow_back,
                          // color: Color.fromARGB(255, 221, 199, 0),
                          size: 30,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 
                        15),
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w500),
                        ),
                      ),
                      
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
                        "Masukan Email",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: controller.email,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.numbers),
                          labelText: "Masukan email",
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
                onPressed: () => authC.resetPassword(controller.email.text),
                // onPressed: () => print('pressed'),
                child: Text(
                  "Send",
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
