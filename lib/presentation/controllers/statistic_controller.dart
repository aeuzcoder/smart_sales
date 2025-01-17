import 'package:smart_sale_boss/presentation/controllers/base_controller.dart';

class StatisticController extends BaseController {
  late DateTime date;

  void init() {
    date = DateTime.now();
  }

  void onForwardMonth() {
    date = date.copyWith(month: date.month + 1);
    update();
  }

  void onBackMonth() {
    date = date.copyWith(month: date.month - 1);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }
}