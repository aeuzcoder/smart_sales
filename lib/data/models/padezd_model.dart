import 'package:smart_sale_boss/data/models/homes_model.dart';

class PadezdModel {
  final int id;
  final int blockId;
  final String name;
  final List<Homes> homes;

  PadezdModel({
    required this.id,
    required this.blockId,
    required this.name,
    required this.homes,
  });

  // Метод fromJson
  factory PadezdModel.fromJson(Map<String, dynamic> json) {
    return PadezdModel(
      id: json['id'],
      blockId: json['block_id'],
      name: json['name'],
      homes: (json['homes'] as List<dynamic>)
          .map((homeJson) => Homes.fromJson(homeJson))
          .toList(),
    );
  }

  // Метод toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'block_id': blockId,
      'name': name,
      'homes': homes.map((home) => home.toJson()).toList(),
    };
  }
}
