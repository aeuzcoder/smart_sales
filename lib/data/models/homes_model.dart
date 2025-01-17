import 'package:smart_sale_boss/data/models/blocks_model.dart';
import 'package:smart_sale_boss/data/models/contract_model.dart';
import 'package:smart_sale_boss/data/models/order_model.dart';
import 'package:smart_sale_boss/data/models/plan_model.dart';

class Homes {
  int? id;
  int? blockId;
  String? number;
  int? stage;
  int? rooms;
  double? square;
  int? repaired;
  int? norepaired;
  int? start;
  int? isrepaired;
  int? islive;
  int? status;
  dynamic image;
  int? planId;
  int? isvalute;
  int? dealPrice;
  int? padezdId;
  int? kadastr;
  Blocks? blocks;
  Plan? plan;
  Order? order;
  Contract? contract;

  Homes({
    this.id,
    this.blockId,
    this.number,
    this.stage,
    this.rooms,
    this.square,
    this.repaired,
    this.norepaired,
    this.start,
    this.isrepaired,
    this.islive,
    this.status,
    this.image,
    this.planId,
    this.isvalute,
    this.dealPrice,
    this.padezdId,
    this.kadastr,
    this.blocks,
    this.plan,
    this.order,
    this.contract,
  });

  factory Homes.fromJson(Map<String, dynamic> json) {
    return Homes(
      id: json["id"],
      blockId: json["block_id"],
      number: json["number"],
      stage: json["stage"],
      rooms: json["rooms"],
      square: json["square"]?.toDouble(),
      repaired: json["repaired"],
      norepaired: json["norepaired"],
      start: json["start"],
      isrepaired: json["isrepaired"],
      islive: json["islive"],
      status: json["status"],
      image: json["image"],
      planId: json["plan_id"],
      isvalute: json["isvalute"],
      dealPrice: json["deal_price"],
      padezdId: json["padezd_id"],
      kadastr: json["kadastr"],
      blocks: json["blocks"] == null ? null : Blocks.fromJson(json["blocks"]),
      plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
      order: json["order"] == null ? null : Order.fromJson(json["order"]),
      contract:
          json["contract"] == null ? null : Contract.fromJson(json["contract"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "block_id": blockId,
        "number": number,
        "stage": stage,
        "rooms": rooms,
        "square": square,
        "repaired": repaired,
        "norepaired": norepaired,
        "start": start,
        "isrepaired": isrepaired,
        "islive": islive,
        "status": status,
        "image": image,
        "plan_id": planId,
        "isvalute": isvalute,
        "deal_price": dealPrice,
        "padezd_id": padezdId,
        "kadastr": kadastr,
        "blocks": blocks?.toJson(),
        "plan": plan?.toJson(),
        "order": order?.toJson(),
        "contract": contract?.toJson(),
      };
}
