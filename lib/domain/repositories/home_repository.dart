import 'package:dartz/dartz.dart';
import 'package:smart_sale_boss/data/models/blok_model.dart';
import 'package:smart_sale_boss/data/models/contract_model.dart';
import 'package:smart_sale_boss/data/models/daily_model.dart';
import 'package:smart_sale_boss/data/models/payment_list_model.dart';
import 'package:smart_sale_boss/data/models/payment_model.dart';
import 'package:smart_sale_boss/data/models/payments_contract_model.dart';

abstract class HomeRepository {
  Future<Either<String, List<DailyModel>>> getDaily();
  Future<Either<String, Contract>> getContract(int contractId);
  Future<Either<String, List<PaymentsContractModel>>> getPaymentContract(
      int contractId);
  Future<Either<String, List<BlokModel>>> getBloks(int objectId);
  Future<Either<String, List<PaymentListModel>>> getPaymentList(int contractId);

  Future<Either<String, List<PaymentModel>>> getPayments();
}
