import 'package:dartz/dartz.dart';
import 'package:smart_sale_boss/data/models/login_model.dart';

abstract class LoginRepository {
    Future<Either<String, LoginModel>> login(String login, String password, String deviceName);
}