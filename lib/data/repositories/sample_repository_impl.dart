import 'package:dartz/dartz.dart';
import '../../domain/repositories/sample_repository.dart';

class SampleRepositoryImpl extends SampleRepository {

  @override
  Future<Either<String, String>> onTextOnly(String text) async {
    try {
      //var response = await NetworkService.POST(NetworkService.API_GEMINI_TALK, NetworkService.paramsTextOnly(text));
      var result = "";
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
