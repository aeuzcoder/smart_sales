import 'package:flutter/material.dart';
import 'package:smart_sale_boss/presentation/controllers/base_controller.dart';

class MainController extends BaseController {
  final pageController = PageController();
  int currentIndex = 0;

  void onChange(int index) {
    pageController.jumpToPage(index);
    currentIndex = index;
    update();
  }
}
