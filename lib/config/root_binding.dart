import 'package:get/get.dart';
import 'package:smart_sale_boss/presentation/controllers/graphics_controller.dart';
import 'package:smart_sale_boss/presentation/controllers/home_controller.dart';
import 'package:smart_sale_boss/presentation/controllers/login_controller.dart';
import 'package:smart_sale_boss/presentation/controllers/main_controller.dart';
import 'package:smart_sale_boss/presentation/controllers/payment_detail_controller.dart';
import 'package:smart_sale_boss/presentation/controllers/show_room_controller.dart';
import 'package:smart_sale_boss/presentation/controllers/splash_controller.dart';
import 'package:smart_sale_boss/presentation/controllers/statistic_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    // Controllers
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<PaymentDetailController>(() => PaymentDetailController(),
        fenix: true);
    Get.lazyPut<GraphicsController>(() => GraphicsController(), fenix: true);
    Get.lazyPut<ShowRoomController>(() => ShowRoomController(), fenix: true);
    Get.lazyPut<StatisticController>(() => StatisticController(), fenix: true);
  }
}
