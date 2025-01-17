import 'dart:convert';

DailyModel dailyModelFromJson(String str) =>
    DailyModel.fromJson(json.decode(str));

String dailyModelToJson(DailyModel data) => json.encode(data.toJson());

class DailyModel {
  String? name;
  int? sum;

  DailyModel({
    this.name,
    this.sum,
  });

  factory DailyModel.fromJson(Map<String, dynamic> json) => DailyModel(
        name: json["name"],
        sum: json["sum"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sum": sum,
      };
}
