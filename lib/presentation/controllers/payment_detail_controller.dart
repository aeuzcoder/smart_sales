import 'package:get/get.dart';
import 'package:smart_sale_boss/data/datasources/network/network_service.dart';
import 'package:smart_sale_boss/data/models/contract_model.dart';
import 'package:smart_sale_boss/data/models/payments_contract_model.dart';
import 'package:smart_sale_boss/data/repositories/home_repository_impl.dart';
import 'package:smart_sale_boss/presentation/controllers/base_controller.dart';

class PaymentDetailController extends BaseController {
  late int contractId;
  Contract? contract;
  List<PaymentsContractModel?>? paymentsContractModel;
  final _repository = HomeRepositoryImpl();

  @override
  void onInit() {
    super.onInit();
    contractId = Get.arguments;
    init();
  }

  String? getUrlImage(String? url) {
    if (url == null) {
      return '';
    } else {
      return 'https://${NetworkService.getServer()}/$url';
    }
  }

  void init() async {
    changeLoading(true);
    final result1 = await _repository.getContract(contractId);

    final result2 = await _repository.getPaymentContract(contractId);

    if (result1.isRight()) {
      contract = result1.getOrElse(() => throw Exception("Unexpected error"));
    }
    if (result2.isRight()) {
      paymentsContractModel =
          result2.getOrElse(() => throw Exception("Unexpected error"));
    }

    changeLoading(false);
  }
}
