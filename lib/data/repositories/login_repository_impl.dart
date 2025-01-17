import 'package:dartz/dartz.dart';
import 'package:smart_sale_boss/data/datasources/network/network_service.dart';
import 'package:smart_sale_boss/data/models/login_model.dart';
import 'package:smart_sale_boss/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<Either<String, LoginModel>> login(
      String login, String password, String deviceName) async {
    try {
      var response = await NetworkService.POST(
          NetworkService.API_LOGIN,
          NetworkService.dataLogin(
            login,
            password,
            deviceName,
          ));
      return Right(loginModelFromJson(response!));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
