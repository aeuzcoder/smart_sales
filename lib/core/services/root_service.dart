import 'package:smart_sale_boss/data/datasources/database/db_service.dart';

class RootService {

  static Future<void> init() async {
    await DBService.init(); // GetStorage Database
  }
}