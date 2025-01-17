import 'package:smart_sale_boss/data/models/blok_model.dart';
import 'package:smart_sale_boss/data/repositories/home_repository_impl.dart';
import 'package:smart_sale_boss/presentation/controllers/base_controller.dart';

class ShowRoomController extends BaseController {
  final _repository = HomeRepositoryImpl();
  late final List<BlokModel> bloks;
  final List<String> companies = [
    'Do\'mbirabod residence',
    'Atlant Quality',
    'Sergeli'
  ];
  String selectedCompany = '';
  String selectedBlok = '';
  List<String> blokItems = [];
  int objectId = 1;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  String fetchObjectName(int id) {
    switch (id) {
      case 1:
        return companies[0];
      case 2:
        return companies[1];
      case 3:
        return companies[2];
      default:
        return '';
    }
  }

  int fetchIdObject() {
    if (selectedCompany == companies[0]) {
      return 1;
    } else if (selectedCompany == companies[1]) {
      return 2;
    } else if (selectedCompany == companies[2]) {
      return 3;
    } else {
      return 1;
    }
  }

  BlokModel getBlok() {
    for (var blok in bloks) {
      if (blok.name == selectedBlok) {
        return blok;
      }
    }
    return bloks[0];
  }

  void init() async {
    changeLoading(true);
    final result = await _repository.getBloks(objectId);
    if (result.isRight()) {
      bloks = result.getOrElse(() => throw Exception("Unexpected error"));
      selectedCompany = fetchObjectName(bloks[0].id);
      selectedBlok = bloks[0].name;
      for (var blok in bloks) {
        blokItems.add(blok.name);
      }
    }
    changeLoading(false);
  }
}
