
import 'package:dartz/dartz.dart';

abstract class SampleRepository {
  Future<Either<String, String>> onTextOnly(String text);
}