import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/auth_controller.dart';
import 'package:babershop_managerment/helper/local_storage_helper.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/authentication/login_screen.dart';
import 'package:babershop_managerment/views/home/navigation.dart';
import 'package:babershop_managerment/views/intro/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ignoreIntroScreen =
      LocalSrorageHelper.getValues('BaberignoreIntroScreen') as bool?;
  @override
  void initState() {
    super.initState();
    // redirectIntroScreen();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return AnimatedSplashScreen(
          duration: 3000,
          backgroundColor: AppColors.primaryBgColor!,
          splash: Image.asset('assets/images/logo.png'),
          splashIconSize: Dimensions.screenHeight * 0.4,
          splashTransition: SplashTransition.sizeTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
          nextScreen: ignoreIntroScreen != null
              ? controller.userLogged
                  ? const NavigationPage()
                  : const LoginScreen()
              : const IntroScreen());
    });
  }
}
