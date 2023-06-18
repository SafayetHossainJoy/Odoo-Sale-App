import 'dart:convert';

SalesQuotation salesQuotationFromJson(String str) => SalesQuotation.fromJson(json.decode(str));

String salesQuotationToJson(SalesQuotation data) => json.encode(data.toJson());

class SalesQuotation {
    SalesQuotation({
        required this.jsonrpc,
        this.id,
        required this.result,
    });

    String jsonrpc;
    dynamic id;
    List<Result> result;

    factory SalesQuotation.fromJson(Map<String, dynamic> json) => SalesQuotation(
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

class Result {
    Result({
        required this.id,
        required this.name,
        required this.customerName,
        required this.companyId,
        required this.companyName,
        required this.dateOrder,
        required this.line,
        required this.partnerInvoiceId,
        required this.partnerInvoiceStreet,
        this.partnerInvoiceCountry,
        required this.amountTotal,
        required this.pricelist,
        required this.state,
    });

    int id;
    String name;
    String customerName;
    CompanyId companyId;
    String companyName;
    DateTime dateOrder;         
    List<Line> line;
    String partnerInvoiceId;
    dynamic partnerInvoiceStreet;
    PartnerInvoiceCountry? partnerInvoiceCountry;
    double amountTotal;
    Pricelist pricelist;
    State state;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        customerName: json["customer_name"],
        companyId: companyIdValues.map[json["company_id"]]!,
        companyName: json["company_name"],
        dateOrder: DateTime.parse(json["date_order"]),
        line: List<Line>.from(json["line"].map((x) => Line.fromJson(x))),
        partnerInvoiceId: json["partner_invoice_id"],
        partnerInvoiceStreet: json["partner_invoice_street"],
        partnerInvoiceCountry: partnerInvoiceCountryValues.map[json["partner_invoice_country"]]!,
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
        "partner_invoice_id": partnerInvoiceId,
        "partner_invoice_street": partnerInvoiceStreet,
        "partner_invoice_country": partnerInvoiceCountryValues.reverse[partnerInvoiceCountry],
        "amount_total": amountTotal,
        "pricelist": pricelistValues.reverse[pricelist],
        "state": stateValues.reverse[state],
    };
}

// ignore: constant_identifier_names
enum CompanyId { RES_COMPANY_1 }

final companyIdValues = EnumValues({
    "res.company(1,)": CompanyId.RES_COMPANY_1
});

class Line {
    Line({
        required this.id,
        required this.productId,
        required this.name,
        required this.productUomQty,
        required this.priceUnit,
        required this.discount,
    });

    int id;
    int productId;
    String name;
    int productUomQty;
    int priceUnit;
    double discount;

    factory Line.fromJson(Map<String, dynamic> json) => Line(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"],
        productUomQty: json["product_uom_qty"],
        priceUnit: json["price_unit"],
        discount: json["discount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": name,
        "product_uom_qty": productUomQty,
        "price_unit": priceUnit,
        "discount": discount,
    };
}

// ignore: constant_identifier_names
enum PartnerInvoiceCountry { BANGLADESH }

final partnerInvoiceCountryValues = EnumValues({
    "Bangladesh": PartnerInvoiceCountry.BANGLADESH
});

// ignore: constant_identifier_names
enum Pricelist { B2_C, B2_B }

final pricelistValues = EnumValues({
    "B2B": Pricelist.B2_B,
    "B2C": Pricelist.B2_C
});

// ignore: constant_identifier_names
enum State { DRAFT, SALE, SENT, CANCEL }

final stateValues = EnumValues({
    "cancel": State.CANCEL,
    "draft": State.DRAFT,
    "sale": State.SALE,
    "sent": State.SENT
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