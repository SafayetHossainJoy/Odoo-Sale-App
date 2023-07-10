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
  String? invoiceOrigin;
  String? companyName;
  String? customerName;
  Street? street;
  City? city;
  StateAddress? stateAddress;
  String? zip;
  Country? country;
  dynamic invoiceDate;
  List<Line>? lines;
  double? amountTotal;
  String? state;

  Result({
    this.id,
    this.name,
    this.invoiceOrigin,
    this.companyName,
    this.customerName,
    this.street,
    required this.invoiceDate,
    this.city,
    this.stateAddress,
    this.zip,
    this.country,
    this.lines,
    this.amountTotal,
    this.state,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        invoiceOrigin: json["invoice_origin"],
        companyName: json["company_name"],
        customerName: json["customer_name"],
        street: streetValues.map[json["street"]]!,
        city: cityValues.map[json["city"]]!,
        stateAddress: stateAddressValues.map[json["state_address"]]!,
        zip: json["zip"],
        country: countryValues.map[json["country"]]!,
        invoiceDate:json["invoice_date"],
        lines: json["lines"] == null
            ? []
            : List<Line>.from(json["lines"]!.map((x) => Line.fromJson(x))),
        amountTotal: json["amount_total"]?.toDouble(),
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "invoice_origin": invoiceOrigin,
        "company_name": companyNameValues.reverse[companyName],
        "customer_name": customerName,
        "street": streetValues.reverse[street],
        "city": cityValues.reverse[city],
        "state_address": stateAddressValues.reverse[stateAddress],
        "zip": zip,
        "country": countryValues.reverse[country],
        "invoice_date": invoiceDate,
        "lines": lines == null
            ? []
            : List<dynamic>.from(lines!.map((x) => x.toJson())),
        "amount_total": amountTotal,
        "state": stateValues.reverse[state],
      };
}

enum City { BEJA }

final cityValues = EnumValues({"beja": City.BEJA});

enum CompanyName { TRIVOZ_SALE }

final companyNameValues = EnumValues({"TRIVOZ SALE": CompanyName.TRIVOZ_SALE});

enum Country { PORTUGAL }

final countryValues = EnumValues({"Portugal": Country.PORTUGAL});

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

enum State { POSTED, DRAFT }

final stateValues = EnumValues({"draft": State.DRAFT, "posted": State.POSTED});

enum StateAddress { BEJA }

final stateAddressValues = EnumValues({"Beja": StateAddress.BEJA});

enum Street { BANASREE_DHAKA }

final streetValues = EnumValues({"Banasree, Dhaka": Street.BANASREE_DHAKA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
