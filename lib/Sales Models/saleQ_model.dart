// To parse this JSON data, do
//
//     final salesquotModel = salesquotModelFromJson(jsonString);

import 'dart:convert';

SalesquotModel salesquotModelFromJson(String str) =>
    SalesquotModel.fromJson(json.decode(str));

String salesquotModelToJson(SalesquotModel data) => json.encode(data.toJson());

class SalesquotModel {
  String jsonrpc;
  dynamic id;
  List<Result> result;

  SalesquotModel({
    required this.jsonrpc,
    this.id,
    required this.result,
  });

  factory SalesquotModel.fromJson(Map<String, dynamic> json) => SalesquotModel(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  int id;
  String name;
  String customerName;
  CompanyId companyId;
  String companyName;
  DateTime dateOrder;
  List<Line> line;
  double amountTotal;
  Pricelist pricelist;
  State state;

  Result({
    required this.id,
    required this.name,
    required this.customerName,
    required this.companyId,
    required this.companyName,
    required this.dateOrder,
    required this.line,
    required this.amountTotal,
    required this.pricelist,
    required this.state,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        customerName: json["customer_name"],
        companyId: companyIdValues.map[json["company_id"]]!,
        companyName: json["company_name"],
        dateOrder: DateTime.parse(json["date_order"]),
        line: List<Line>.from(json["line"].map((x) => Line.fromJson(x))),
        amountTotal: json["amount_total"]?.toDouble(),
        pricelist: pricelistValues.map[json["pricelist"]]!,
        state: stateValues.map[json["state"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "customer_name": customerName,
        "company_id": companyIdValues.reverse[companyId],
        "company_name": companyName,
        "date_order": dateOrder.toIso8601String(),
        "line": List<dynamic>.from(line.map((x) => x.toJson())),
        "amount_total": amountTotal,
        "pricelist": pricelistValues.reverse[pricelist],
        "state": stateValues.reverse[state],
      };
}

enum CompanyId { RES_COMPANY_1 }

final companyIdValues =
    EnumValues({"res.company(1,)": CompanyId.RES_COMPANY_1});

class Line {
  int lineId;
  int productId;
  String name;
  double productUomQty;
  double priceUnit;
  double discount;

  Line({
    required this.lineId,
    required this.productId,
    required this.name,
    required this.productUomQty,
    required this.priceUnit,
    required this.discount,
  });

  factory Line.fromJson(Map<String, dynamic> json) => Line(
        lineId: json["line_id"],
        productId: json["product_id"],
        name: json["name"],
        productUomQty: json["product_uom_qty"],
        priceUnit: json["price_unit"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "line_id": lineId,
        "product_id": productId,
        "name": name,
        "product_uom_qty": productUomQty,
        "price_unit": priceUnit,
        "discount": discount,
      };
}

enum Pricelist { PUBLIC_PRICELIST }

final pricelistValues =
    EnumValues({"Public Pricelist": Pricelist.PUBLIC_PRICELIST});

enum State { SALE, DRAFT, SENT }

final stateValues =
    EnumValues({"draft": State.DRAFT, "sale": State.SALE, "sent": State.SENT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
