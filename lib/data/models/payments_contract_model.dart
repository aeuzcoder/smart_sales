import 'package:smart_sale_boss/data/models/staff_model.dart';
import 'package:smart_sale_boss/data/models/types_model.dart';

class PaymentsContractModel {
  int id;
  int contractId;
  int userId;
  String date;
  int sum;
  int typeId;
  int isValute;
  int valute;
  int status;
  int number;
  String? comment;
  Types types;
  Staff staff;

  PaymentsContractModel({
    required this.id,
    required this.contractId,
    required this.userId,
    required this.date,
    required this.sum,
    required this.typeId,
    required this.isValute,
    required this.valute,
    required this.status,
    required this.number,
    this.comment,
    required this.types,
    required this.staff,
  });

  // Десериализация из JSON
  factory PaymentsContractModel.fromJson(Map<String, dynamic> json) {
    return PaymentsContractModel(
      id: json['id'],
      contractId: json['contract_id'],
      userId: json['user_id'],
      date: json['date'],
      sum: json['sum'],
      typeId: json['type_id'],
      isValute: json['isvalute'],
      valute: json['valute'],
      status: json['status'],
      number: json['number'],
      comment: json['comment'],
      types: Types.fromJson(json['types']),
      staff: Staff.fromJson(json['staff']),
    );
  }

  // Сериализация в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'contract_id': contractId,
      'user_id': userId,
      'date': date,
      'sum': sum,
      'type_id': typeId,
      'isvalute': isValute,
      'valute': valute,
      'status': status,
      'number': number,
      'comment': comment,
      'types': types.toJson(),
      'staff': staff.toJson(),
    };
  }
}
