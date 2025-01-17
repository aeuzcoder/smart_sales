import 'dart:async';

import 'package:get/get.dart';
import 'package:smart_sale_boss/data/datasources/database/db_service.dart';
import 'package:smart_sale_boss/presentation/pages/login_page/login_page.dart';
import 'package:smart_sale_boss/presentation/pages/main_page/main_page.dart';

import 'base_controller.dart';

class SplashController extends BaseController {
  initTimer() {
    Timer(const Duration(seconds: 2), () {
      _callNextPage();
    });
  }

  _callNextPage() {
    if (DBService.to.getAccessToken().isNotEmpty) {
      Get.off(const MainPage());
    } else {
      Get.off(const LoginPage());
    }
  }
}
