import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/home/homepage.dart';
import 'package:krishnaGopal/themes/app_theme.dart';
import 'package:krishnaGopal/controller/theme_controller.dart';

void main() {

  // ThemeController register karo
  Get.put(ThemeController());

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {

    // controller access
    final ThemeController themeController = Get.find();

    return Obx(() => GetMaterialApp(
      title: 'Krishna Gopal Sen — Mobile Application Developer',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      // dynamic theme
      themeMode: themeController.themeMode.value,

      home: const PortfolioHome(),
    ));
  }
}

