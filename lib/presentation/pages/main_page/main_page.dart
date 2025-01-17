import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_sale_boss/core/utils/app_assets.dart';
import 'package:smart_sale_boss/core/utils/app_colors.dart';
import 'package:smart_sale_boss/presentation/controllers/main_controller.dart';
import 'package:smart_sale_boss/presentation/pages/home_page/home_page.dart';
import 'package:smart_sale_boss/presentation/pages/show_room_page/show_room_page.dart';
import 'package:smart_sale_boss/presentation/pages/statistic_page/statistic_page.dart';
import 'package:smart_sale_boss/presentation/widgets/custom_svg.dart';

class MainPage extends StatefulWidget {
  static const String id = "main_page";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            const HomePage(),
            const ShowRoomPage(),
            StatisticPage(),
            // StatisticPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex,
          onTap: controller.onChange,
          items: [
            _navItem(AppAssets.icons.icNavHome, 'Asosiy'),
            _navItem(AppAssets.icons.icNavBell, 'Showroom'),
            _navItem(AppAssets.icons.icNavPerson, 'Statistika'),
          ],
        ),
      );
    });
  }

  _navItem(icon, label) {
    return BottomNavigationBarItem(
      icon: CustomSvg(iconSvg: icon, color: AppColors.n979C9E),
      activeIcon: CustomSvg(iconSvg: icon, color: AppColors.primaryColor),
      label: label,
    );
  }
}
