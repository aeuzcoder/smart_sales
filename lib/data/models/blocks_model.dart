import 'package:smart_sale_boss/data/models/objects_model.dart';

class Blocks {
  int? id;
  String? name;
  int? roomNumber;
  int? objectsId;
  int? month;
  Objects? objects;

  Blocks({
    this.id,
    this.name,
    this.roomNumber,
    this.objectsId,
    this.month,
    this.objects,
  });

  factory Blocks.fromJson(Map<String, dynamic> json) {
    return Blocks(
      id: json['id'],
      name: json['name'],
      roomNumber: json['room_number'],
      objectsId: json['objects_id'],
      month: json['month'],
      objects: Objects.fromJson(json['objects']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'room_number': roomNumber,
      'objects_id': objectsId,
      'month': month,
      'objects': objects?.toJson(),
    };
  }
}
