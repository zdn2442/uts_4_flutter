import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/phone_login_controller.dart';

class PhoneLoginView extends GetView<PhoneLoginController> {
  final authC = Get.put(AuthController());
  final controller = Get.put(PhoneLoginController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.fromLTRB(30, 60, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: tinggi * 0.87,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Login with phone number",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 300,
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "On this application you can also login with your own beautiful phone number now, We'll send you an OTP code SMS. Make no one knows.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone Number",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: controller.phone,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff3B9AE1))),
                                      prefixIcon: Container(
                                        width: lebar * 0.13,
                                        child: Row(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    5, 3, 5, 3),
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  "+62",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color.fromARGB(
                                                          117, 23, 23, 52)),
                                                )),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 5, 0, 5),
                                              height: tinggi * 0.04,
                                              child: VerticalDivider(
                                                color: Color(0x401b1b1b),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      hintText: "Phone Number",
                                      labelText: "Phone Number",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 24, 150, 208),
                            minimumSize: Size(500, 55),
                          ),
                          onPressed: () {
                            authC.verifyPhone(controller.phone.text);
                          },
                          child: Text(
                            "Send OTP",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
