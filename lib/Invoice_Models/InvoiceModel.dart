// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

InvoiceModel invoiceModelFromJson(String str) =>
    InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());

class InvoiceModel {
  String? jsonrpc;
  dynamic id;
  List<Result>? result;

  InvoiceModel({
    this.jsonrpc,
    this.id,
    this.result,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
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
  dynamic companyName;
  DateTime invoiceDate;
  List<Line>? lines;
  double? amountTotal;
  dynamic state;

  Result({
    this.id,
    this.name,
    this.companyName,
    required this.invoiceDate,
    this.lines,
    this.amountTotal,
    this.state,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        companyName: json["company_name"]!,
        invoiceDate: DateTime.parse(json["invoice_date"]),
        lines: json["lines"] == null
            ? []
            : List<Line>.from(json["lines"]!.map((x) => Line.fromJson(x))),
        amountTotal: json["amount_total"]?.toDouble(),
        state: json["state"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "company_name": companyName,
        "invoice_date": invoiceDate.toIso8601String(),
        "lines": lines == null
            ? []
            : List<dynamic>.from(lines!.map((x) => x.toJson())),
        "amount_total": amountTotal,
        "state": stateValues.reverse[state],
      };
}

enum CompanyName { ASH_TEST_CUSTOMER_1, ADMINISTRATOR, ANONYMOUS, S_FLUTTER }

final companyNameValues = EnumValues({
  "Administrator": CompanyName.ADMINISTRATOR,
  "anonymous": CompanyName.ANONYMOUS,
  "ash test customer 1": CompanyName.ASH_TEST_CUSTOMER_1,
  "S flutter": CompanyName.S_FLUTTER
});

class Line {
  int? productId;
  String? productName;
  double? productQty;
  double? priceUnit;
  double? priceSubtotal;

  Line({
    this.productId,
    this.productName,
    this.productQty,
    this.priceUnit,
    this.priceSubtotal,
  });

  factory Line.fromJson(Map<String, dynamic> json) => Line(
        productId: json["product_id"],
        productName: json["product_name"],
        productQty: json["product_qty"],
        priceUnit: json["price_unit"],
        priceSubtotal: json["price_subtotal"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_qty": productQty,
        "price_unit": priceUnit,
        "price_subtotal": priceSubtotal,
      };
}

enum State { POSTED }

final stateValues = EnumValues({"posted": State.POSTED});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
