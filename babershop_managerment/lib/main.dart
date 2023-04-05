import 'dart:io';

import 'package:babershop_managerment/controller/auth_controller.dart';
import 'package:babershop_managerment/controller/babershop_controller.dart';
import 'package:babershop_managerment/controller/hairstyle_controller.dart';
import 'package:babershop_managerment/controller/services_controller.dart';
import 'package:babershop_managerment/helper/local_storage_helper.dart';
import 'package:babershop_managerment/views/intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'helper/dependentcies.dart' as dep;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await LocalSrorageHelper.initLocalStorageHelper();
  await dep.AppDependentcies.init();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.find<AuthController>().checkUserLogged();
    Get.find<HairStyleController>().getLimitHairstyle();
    Get.find<HairStyleController>().getHairstyle();
    Get.find<ServiceController>().getServices();
    Get.find<BabershopController>().getBabershop();

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'LAMHOTTOC',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
