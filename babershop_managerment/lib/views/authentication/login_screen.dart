import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/auth_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/authentication/widget/button.dart';
import 'package:babershop_managerment/views/authentication/widget/password_field.dart';
import 'package:babershop_managerment/views/authentication/widget/rich_text.dart';
import 'package:babershop_managerment/views/authentication/widget/text_field.dart';
import 'package:babershop_managerment/views/home/navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();

    void login(AuthController authController) {
      authController
          .login(usernameController.text, passwordController.text)
          .then((value) {
        if (value['status']) {
          Get.to(() => const NavigationPage());
        } else {
          Get.snackbar(
            'Đăng nhập thất bại',
            'Đã có lỗi sảy ra trong quá trình đăng nhập',
            backgroundColor: AppColors.primaryColor,
            colorText: Colors.white,
          );
        }
      });
    }

    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SizedBox(
            height: Dimensions.screenHeight,
            child: Stack(
              children: <Widget>[
                //content ui
                Positioned(
                  top: 8.0,
                  child: SizedBox(
                    width: Dimensions.screenWidth,
                    height: Dimensions.screenHeight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.screenWidth * 0.06),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //logo section
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Dimensions.heightPadding15 + 1,
                                ),
                                RichTextCustom(
                                  fontSize: Dimensions.screenWidth / 15,
                                  headerText: 'Đăng',
                                  footerText: 'Nhập',
                                ),
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: Dimensions.height220,
                                  width: Dimensions.width150 + 70,
                                ),
                              ],
                            ),
                          ),
                          //email and password TextField here
                          Expanded(
                            flex: 6,
                            child: Column(
                              children: [
                                TextFieldCustom(
                                  hint: 'Nhập tên đăng nhập',
                                  icon: Icons.mail_rounded,
                                  controller: usernameController,
                                ),
                                SizedBox(
                                  height: Dimensions.heightPadding10 - 2,
                                ),
                                PasswordField(
                                  suffixIcon: Icons.visibility,
                                  hint: 'Nhập mật khẩu',
                                  icon: Icons.lock,
                                  controller: passwordController,
                                ),
                                SizedBox(
                                  height: Dimensions.heightPadding45,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    login(authController);
                                  },
                                  child: const CustomButton(
                                    text: 'Đăng nhập',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
