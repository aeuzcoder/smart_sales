import 'package:smart_sale_boss/data/models/payment_list_model.dart';
import 'package:smart_sale_boss/data/repositories/home_repository_impl.dart';
import 'package:smart_sale_boss/presentation/controllers/base_controller.dart';

class GraphicsController extends BaseController {
  int contractId = 1;
  List<PaymentListModel?>? payments;
  final _repository = HomeRepositoryImpl();
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void fetchId(int id) {
    contractId = id;
  }

  void init() async {
    changeLoading(true);
    final result = await _repository.getPaymentList(contractId);

    if (result.isRight()) {
      payments = result.getOrElse(() => throw Exception("Unexpected error"));
    }

    changeLoading(false);
  }
}
