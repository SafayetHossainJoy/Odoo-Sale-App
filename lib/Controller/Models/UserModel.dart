// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.jsonrpc,
        this.id,
        required this.result,
    });

    String jsonrpc;
    dynamic id;
    Result result;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": result.toJson(),
    };
}

class Result {
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
        required this.message,
        required this.error,
        required this.code,
    });

    int partnerId;
    String name;
    dynamic companyId;
    dynamic companyName;
    bool city;
    bool street;
    bool street2;
    String email;
    bool phone;
    String mobile;
    bool function;
    String message;
    bool error;
    int code;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        partnerId: json["partner_id"],
        name: json["name"],
        companyId: json["company_id"],
        companyName: json["company_name"],
        city: json["city"],
        street: json["street"],
        street2: json["street2"],
        email: json["email"],
        phone: json["phone"],
        mobile: json["mobile"],
        function: json["function"],
        message: json["message"],
        error: json["error"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "partner_id": partnerId,
        "name": name,
        "company_id": companyId,
        "company_name": companyName,
        "city": city,
        "street": street,
        "street2": street2,
        "email": email,
        "phone": phone,
        "mobile": mobile,
        "function": function,
        "message": message,
        "error": error,
        "code": code,
    };
}
