// To parse this JSON data, do
//
//     final allcustomerModel = allcustomerModelFromJson(jsonString);

import 'dart:convert';

AllcustomerModel allcustomerModelFromJson(String str) => AllcustomerModel.fromJson(json.decode(str));

String allcustomerModelToJson(AllcustomerModel data) => json.encode(data.toJson());

class AllcustomerModel {
    String jsonrpc;
    dynamic id;
    List<Result> result;

    AllcustomerModel({
        required this.jsonrpc,
        this.id,
        required this.result,
    });

    factory AllcustomerModel.fromJson(Map<String, dynamic> json) => AllcustomerModel(
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
    int partnerId;
    String name;
    CompanyId? companyId;
    CompanyName? companyName;
    dynamic city;
    dynamic street;
    dynamic street2;
    dynamic email;
    dynamic phone;
    dynamic mobile;
    dynamic function;

    Result({
        required this.partnerId,
        required this.name,
        this.companyId,
        this.companyName,
        required this.city,
        required this.street,
        required this.street2,
        required this.email,
        required this.phone,
        required this.mobile,
        required this.function,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        partnerId: json["partner_id"],
        name: json["name"],
        companyId: companyIdValues.map[json["company_id"]]!,
        companyName: companyNameValues.map[json["company_name"]]!,
        city: json["city"],
        street: json["street"],
        street2: json["street2"],
        email: json["email"],
        phone: json["phone"],
        mobile: json["mobile"],
        function: json["function"],
    );

    Map<String, dynamic> toJson() => {
        "partner_id": partnerId,
        "name": name,
        "company_id": companyIdValues.reverse[companyId],
        "company_name": companyNameValues.reverse[companyName],
        "city": city,
        "street": street,
        "street2": street2,
        "email": email,
        "phone": phone,
        "mobile": mobile,
        "function": function,
    };
}

enum CompanyId { RES_COMPANY_1 }

final companyIdValues = EnumValues({
    "res.company(1,)": CompanyId.RES_COMPANY_1
});

enum CompanyName { TRIVOZ_SALE }

final companyNameValues = EnumValues({
    "TRIVOZ SALE": CompanyName.TRIVOZ_SALE
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
