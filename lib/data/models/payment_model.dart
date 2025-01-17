import 'dart:convert';

import 'package:smart_sale_boss/data/models/contract_model.dart';
import 'package:smart_sale_boss/data/models/staff_model.dart';
import 'package:smart_sale_boss/data/models/types_model.dart';

PaymentModel paymentModelFromJson(String str) =>
    PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  int? id;
  int? contractId;
  int? userId;
  DateTime? date;
  int? sum;
  int? typeId;
  int? isvalute;
  int? valute;
  int? status;
  int? number;
  dynamic comment;
  Contract? contract;
  Staff? staff;
  Types? types;
  List<dynamic>? changes;

  PaymentModel({
    this.id,
    this.contractId,
    this.userId,
    this.date,
    this.sum,
    this.typeId,
    this.isvalute,
    this.valute,
    this.status,
    this.number,
    this.comment,
    this.contract,
    this.staff,
    this.changes,
    this.types,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        id: json["id"],
        contractId: json["contract_id"],
        userId: json["user_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        sum: json["sum"],
        typeId: json["type_id"],
        isvalute: json["isvalute"],
        valute: json["valute"],
        status: json["status"],
        number: json["number"],
        comment: json["comment"],
        contract: json["contract"] == null
            ? null
            : Contract.fromJson(json["contract"]),
        staff: json["staff"] == null ? null : Staff.fromJson(json["staff"]),
        changes: json["changes"] == null
            ? []
            : List<dynamic>.from(json["changes"]!.map((x) => x)),
        types: json["types"] == null ? null : Types.fromJson(json["types"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contract_id": contractId,
        "user_id": userId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "sum": sum,
        "type_id": typeId,
        "isvalute": isvalute,
        "valute": valute,
        "status": status,
        "number": number,
        "comment": comment,
        "contract": contract?.toJson(),
        "staff": staff?.toJson(),
        "changes":
            changes == null ? [] : List<dynamic>.from(changes!.map((x) => x)),
        "types": types?.toJson(),
      };
}
