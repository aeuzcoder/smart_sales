import 'package:smart_sale_boss/data/models/custom_model.dart';
import 'package:smart_sale_boss/data/models/homes_model.dart';
import 'package:smart_sale_boss/data/models/staff_model.dart';

class Contract {
  final int? id;
  final String? name;
  final int? userId;
  final int? homeId;
  final int? clientId;
  final int? clientType;
  final double? square;
  final int? price;
  final int? sum;
  final int? left;
  final int? discount;
  final int? startPrice;
  final DateTime? date;
  final String? comment;
  final int? status;
  final int? isRepaired;
  final int? peniya;
  final int? isValute;
  final int? valute;
  final int? leftSum;
  final int? leftValute;
  final int? totalSum;
  final int? totalValute;
  final int? type;
  final int? operatorId;
  final Homes? homes;
  final Custom? custom;
  final Staff? staff;

  Contract({
    this.id,
    this.name,
    this.userId,
    this.homeId,
    this.clientId,
    this.clientType,
    this.square,
    this.price,
    this.sum,
    this.left,
    this.discount,
    this.startPrice,
    this.date,
    this.comment,
    this.status,
    this.isRepaired,
    this.peniya,
    this.isValute,
    this.valute,
    this.leftSum,
    this.leftValute,
    this.totalSum,
    this.totalValute,
    this.type,
    this.operatorId,
    this.homes,
    this.custom,
    this.staff,
  });
  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json["id"],
      name: json["name"]?.toString(), // Безопасное приведение к строке
      userId: json["user_id"],
      homeId: json["home_id"],
      clientId: json["client_id"],
      clientType: json["client_type"],
      square: (json["square"] is double)
          ? json["square"]
          : json["square"]?.toDouble(),
      price: json["price"],
      sum: (json["sum"] is double)
          ? (json["sum"] as double).toInt()
          : json["sum"],
      left: json["left"],
      discount: (json["discount"] is double)
          ? (json["discount"] as double).toInt()
          : json["discount"],
      startPrice: (json["start_price"] is double)
          ? (json["start_price"] as double).toInt()
          : json["start_price"],
      date: (json["date"] != null && json["date"].isNotEmpty)
          ? DateTime.tryParse(json["date"])
          : null,
      comment: json["comment"],
      status: json["status"],
      isRepaired: json["isrepaired"],
      peniya: json["peniya"],
      isValute: json["isvalute"],
      valute: json["valute"],
      leftSum: json["leftsum"],
      leftValute: json["leftvalute"],
      totalSum: json["totalsum"],
      totalValute: json["totalvalute"],
      type: json["type"],
      operatorId: json["operator_id"],
      homes: json["homes"] != null ? Homes.fromJson(json["homes"]) : null,
      custom: json["custom"] != null ? Custom.fromJson(json["custom"]) : null,
      staff: json["staff"] != null ? Staff.fromJson(json["staff"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "user_id": userId,
      "home_id": homeId,
      "client_id": clientId,
      "client_type": clientType,
      "square": square,
      "price": price,
      "sum": sum,
      "left": left,
      "discount": discount,
      "start_price": startPrice,
      "date": date?.toIso8601String(),
      "comment": comment,
      "status": status,
      "isrepaired": isRepaired,
      "peniya": peniya,
      "isvalute": isValute,
      "valute": valute,
      "leftsum": leftSum,
      "leftvalute": leftValute,
      "totalsum": totalSum,
      "totalvalute": totalValute,
      "type": type,
      "operator_id": operatorId,
      "homes": homes?.toJson(),
      "custom": custom?.toJson(),
      "staff": staff?.toJson(),
    };
  }
}
