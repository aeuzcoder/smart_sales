import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:smart_sale_boss/data/datasources/network/network_service.dart';
import 'package:smart_sale_boss/data/models/blok_model.dart';
import 'package:smart_sale_boss/data/models/contract_model.dart';
import 'package:smart_sale_boss/data/models/daily_model.dart';
import 'package:smart_sale_boss/data/models/payment_list_model.dart';
import 'package:smart_sale_boss/data/models/payment_model.dart';
import 'package:smart_sale_boss/data/models/payments_contract_model.dart';
import 'package:smart_sale_boss/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Either<String, List<DailyModel>>> getDaily() async {
    try {
      var response = await NetworkService.GET(
          NetworkService.API_DICTIONAY_DAILY, NetworkService.paramsEmpty());
      final resultJson = jsonDecode((response!));
      final result = resultJson['data']
          .map<DailyModel>((e) => DailyModel.fromJson(e))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<PaymentModel>>> getPayments() async {
    try {
      var response = await NetworkService.GET(
          NetworkService.API_DICTIONAY_PAYMENTS, NetworkService.paramsEmpty());

      final resultJson = jsonDecode((response!));
      List<PaymentModel> result = resultJson['data']['data']
          .map<PaymentModel>((e) => PaymentModel.fromJson(e))
          .toList();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Contract>> getContract(int contractId) async {
    try {
      var response = await NetworkService.GET(
          '${NetworkService.API_ADMIN_CONTRACT}/$contractId',
          NetworkService.paramsEmpty());

      final resultJson = jsonDecode((response!));

      final result = Contract.fromJson(resultJson['data']);

      return Right(result);
    } catch (e) {
      log(e.toString());
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<PaymentsContractModel>>> getPaymentContract(
      int contractId) async {
    try {
      var response = await NetworkService.GET(
          '${NetworkService.API_DICTIONARY_PAYMENTSCONTRACT}/$contractId',
          NetworkService.paramsEmpty());

      final resultJson = jsonDecode((response!));
      final result = resultJson['data']
          .map<PaymentsContractModel>(
              (model) => PaymentsContractModel.fromJson(model))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<PaymentListModel>>> getPaymentList(
      int contractId) async {
    try {
      var response = await NetworkService.GET(
          '${NetworkService.API_CONTRACT_LIST}/$contractId',
          NetworkService.paramsEmpty());
      final resultJson = jsonDecode((response!));

      final result = (resultJson['data'] as List)
          .map<PaymentListModel>((model) => PaymentListModel.fromJson(model))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BlokModel>>> getBloks(int objectId) async {
    try {
      var response = await NetworkService.GET(
          '${NetworkService.API_ADMIN_HOME_PADEZD}/$objectId',
          NetworkService.paramsEmpty());
      final resultJson = jsonDecode((response!));
      log(resultJson.toString());

      final result = (resultJson['data'] as List)
          .map<BlokModel>((model) => BlokModel.fromJson(model))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
