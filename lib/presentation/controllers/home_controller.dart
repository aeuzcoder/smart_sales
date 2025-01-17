import 'package:smart_sale_boss/data/models/daily_model.dart';
import 'package:smart_sale_boss/data/models/payment_model.dart';
import 'package:smart_sale_boss/data/repositories/home_repository_impl.dart';
import 'package:smart_sale_boss/presentation/controllers/base_controller.dart';

class HomeController extends BaseController {
  final _repository = HomeRepositoryImpl();
  List<PaymentModel> payments = [];
  List<DailyModel> dailies = [];

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    changeLoading(true);
    final result1 = await _repository.getDaily();
    final result2 = await _repository.getPayments();

    if (result1.isRight()) {
      dailies = result1.getOrElse(() => throw Exception("Unexpected error"));
    }
    if (result2.isRight()) {
      payments = result2.getOrElse(() => throw Exception("Unexpected error"));
    }
    changeLoading(false);
  }
}
