import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uts_4_flutter/app/controllers/auth_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final controller = Get.put(LoginController());
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 60, right: 60, top: 95),
          child: Column(
            children: [
              Container(
                height: tinggi * 0.84,
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Login",
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
                      margin: EdgeInsets.only(top: 60),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Email Address",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: TextField(
                              controller: controller.email,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle),
                                  labelText: "Enter your Email",
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(117, 23, 23, 52)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Color(0xff3B9AE1)))),
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
                                "Password",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: TextField(
                              controller: controller.password,
                              obscureText: controller.hiddenPassword.value
                                  ? true
                                  : false,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                  labelText: "Enter your Password",
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(117, 23, 23, 52)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color:
                                              Color(0xff3B9AE1))),
                                  suffixIcon: IconButton(
                                    onPressed: () => controller.changeEye(),
                                    icon: Icon(controller.hiddenPassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: 5),
                      child: TextButton(
                          // onPressed: () => Get.toNamed(Routes.FORGOT_PASS),
                          onPressed: () => Get.toNamed(Routes.FOR_PASS),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                color: Color.fromARGB(117, 23, 23, 52),
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      width: lebar,
                      height: tinggi * 0.05,
                      child: ElevatedButton(
                        onPressed: () => authC.login(controller.email.text,
                                controller.password.text),
                        // onPressed: () => print('pressed'),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 24, 150, 208)),
                      ),
                    ),
                    Container(
                      width: lebar,
                      margin: EdgeInsets.only(top: 30, left: 40),
                      child: Row(
                        children: [
                          Container(
                              width: 70,
                              height: 1,
                              color: Color.fromARGB(117, 23, 23, 52)),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Or Login With",
                              style: TextStyle(
                                  color: Color.fromARGB(117, 23, 23, 52)),
                            ),
                          ),
                          Container(
                              width: 70,
                              height: 1,
                              color: Color.fromARGB(117, 23, 23, 52)),
                        ],
                      ),
                    ),
                    Container(
                      // width: lebar,
                      height: tinggi * 0.08,
                      padding: EdgeInsets.only(left: 120, top: 25),
                      // color: Colors.black,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => authC.signInWithGoogle(),
                            child: Container(
                              decoration: BoxDecoration(
                                 border: Border.all(width: 1, color: Color(0xff00D7FF)),
                                borderRadius: BorderRadius.circular(100)
                              ),
                              width: lebar * 0.11,
                              height: tinggi * 0.05,
                              child: Image.asset('assets/images/Google.png'),
                            ),
                          ),
                          SizedBox(width: 20,),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.PHONE_LOGIN),
                            child: Container(
                              decoration: BoxDecoration(
                                 border: Border.all(width: 1, color: Color(0xff00D7FF)),
                                borderRadius: BorderRadius.circular(100)
                              ),
                              width: lebar * 0.11,
                              height: tinggi * 0.05,
                              child: Icon(Icons.call),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(left: 97,),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "Don`t have an account?",
                        style:
                            TextStyle(color: Color.fromARGB(117, 23, 23, 52)),
                      ),
                    ),
                    TextButton(
                        onPressed: () => Get.toNamed(Routes.REGISTER),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.blue[300]),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
