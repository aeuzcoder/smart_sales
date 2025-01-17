import 'package:smart_sale_boss/data/models/padezd_model.dart';

class BlokModel {
  final int id;
  final String name;
  final int roomNumber;
  final int objectsId;
  final int month;
  final List<PadezdModel> padezdModels;

  BlokModel({
    required this.id,
    required this.name,
    required this.roomNumber,
    required this.objectsId,
    required this.month,
    required this.padezdModels,
  });

  // Метод fromJson
  factory BlokModel.fromJson(Map<String, dynamic> json) {
    return BlokModel(
      id: json['id'],
      name: json['name'],
      roomNumber: json['room_number'],
      objectsId: json['objects_id'],
      month: json['month'],
      padezdModels: (json['padezd'] as List)
          .map((padezdJson) => PadezdModel.fromJson(padezdJson))
          .toList(),
    );
  }

  // Метод toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'room_number': roomNumber,
      'objects_id': objectsId,
      'month': month,
      'padezd_models': padezdModels.map((padezd) => padezd.toJson()).toList(),
    };
  }
}
