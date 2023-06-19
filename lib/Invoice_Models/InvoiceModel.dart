// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'dart:convert';

import 'package:sale/Invoice_Models/main_quotation.dart';


InvoiceModel invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());

class InvoiceModel {
    String jsonrpc;
    dynamic id;
    List<Result> result;

    InvoiceModel({
        required this.jsonrpc,
        this.id,
        required this.result,
    });

    factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}



