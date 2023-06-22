// To parse this JSON data, do
//
//     final deliveryModel = deliveryModelFromJson(jsonString);

import 'dart:convert';

DeliveryModel deliveryModelFromJson(String str) =>
    DeliveryModel.fromJson(json.decode(str));

String deliveryModelToJson(DeliveryModel data) => json.encode(data.toJson());

class DeliveryModel {
  String? jsonrpc;
  dynamic id;
  List<Result>? result;

  DeliveryModel({
    this.jsonrpc,
    this.id,
    this.result,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  int? id;
  String? name;
  String? deliveryAddress;
  DateTime? scheduledDate;
  String? origin;
  List<MoveIdsWithoutPackage>? moveIdsWithoutPackage;
  dynamic status;

  Result({
    this.id,
    this.name,
    this.deliveryAddress,
    this.scheduledDate,
    this.origin,
    this.moveIdsWithoutPackage,
    this.status,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        deliveryAddress: json["delivery_address"],
        scheduledDate: json["scheduled_date"] == null
            ? null
            : DateTime.parse(json["scheduled_date"]),
        origin: json["origin"],
        moveIdsWithoutPackage: json["move_ids_without_package"] == null
            ? []
            : List<MoveIdsWithoutPackage>.from(json["move_ids_without_package"]!
                .map((x) => MoveIdsWithoutPackage.fromJson(x))),
        status: json["status"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "delivery_address": deliveryAddress,
        "scheduled_date": scheduledDate?.toIso8601String(),
        "origin": origin,
        "move_ids_without_package": moveIdsWithoutPackage == null
            ? []
            : List<dynamic>.from(moveIdsWithoutPackage!.map((x) => x.toJson())),
        "status": statusValues.reverse[status],
      };
}

class MoveIdsWithoutPackage {
  int? productId;
  String? name;
  double? productUomQty;
  double? reservedAvailability;
  double? quantityDone;
  dynamic description;

  MoveIdsWithoutPackage({
    this.productId,
    this.name,
    this.productUomQty,
    this.reservedAvailability,
    this.quantityDone,
    this.description,
  });

  factory MoveIdsWithoutPackage.fromJson(Map<String, dynamic> json) =>
      MoveIdsWithoutPackage(
        productId: json["product_id"],
        name: json["name"],
        productUomQty: json["product_uom_qty"],
        reservedAvailability: json["reserved_availability"],
        quantityDone: json["quantity_done"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "product_uom_qty": productUomQty,
        "reserved_availability": reservedAvailability,
        "quantity_done": quantityDone,
        "description": description,
      };
}

enum DescriptionEnum { SAMPLE_DESCRIPTION_FOR_DELIVERY_ORDERS }

final descriptionEnumValues = EnumValues({
  "Sample Description for Delivery Orders":
      DescriptionEnum.SAMPLE_DESCRIPTION_FOR_DELIVERY_ORDERS
});

enum Status { CONFIRMED, DONE, DRAFT }

final statusValues = EnumValues({
  "confirmed": Status.CONFIRMED,
  "done": Status.DONE,
  "draft": Status.DRAFT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
