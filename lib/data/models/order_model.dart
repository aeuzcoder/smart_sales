import 'package:smart_sale_boss/data/models/custom_model.dart';

class Order {
  final int? id;
  final int? homeId;
  final int? customId;
  final int? userId;
  final DateTime? date;
  final int? status;
  final DateTime? createdAt;
  final Custom? custom;

  Order({
    this.id,
    this.homeId,
    this.customId,
    this.userId,
    this.date,
    this.status,
    this.createdAt,
    this.custom,
  });

  // Метод для преобразования из JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      homeId: json['home_id'],
      customId: json['custom_id'],
      userId: json['user_id'],
      date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
      status: json['status'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      custom: json['custom'] != null ? Custom.fromJson(json['custom']) : null,
    );
  }

  // Метод для преобразования в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'home_id': homeId,
      'custom_id': customId,
      'user_id': userId,
      'date': date?.toIso8601String(),
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'custom': custom?.toJson(),
    };
  }
}
