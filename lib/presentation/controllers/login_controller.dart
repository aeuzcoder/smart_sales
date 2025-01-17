import 'package:smart_sale_boss/core/services/device_service.dart';
import 'package:smart_sale_boss/data/datasources/database/db_service.dart';
import 'package:smart_sale_boss/data/models/user_model.dart';
import 'package:smart_sale_boss/data/repositories/login_repository_impl.dart';
import 'package:smart_sale_boss/presentation/controllers/base_controller.dart';

class LoginController extends BaseController {
  final _repository = LoginRepositoryImpl();
  bool obscureText = true;

  void onChangeObscure() {
    obscureText = !obscureText;
    update();
  }

  Future<bool> onLogin(String login, String password) async {
    changeLoading(true);
    String deviceName = await DeviceService.deviceName();
    final res = await _repository.login(login, password, deviceName);
    if (res.isRight()) {
      var loginData = res.getOrElse(() => throw Exception("Unexpected error"));
      if ((loginData.accessToken).isNotEmpty && (loginData.user) != null) {
        await DBService.to.setAccessToken(loginData.accessToken);
        await DBService.to.setUser(userModelToJson(loginData.user!));
        return true;
      }
    }
    changeLoading(false);
    return false;
  }
}
