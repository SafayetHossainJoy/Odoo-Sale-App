import 'package:sale/Invoice_Models/line_model.dart';
import 'package:sale/Invoice_Models/status_model.dart';

class Result {
    int id;
    String name;
    String companyName;
    dynamic invoiceDate;
    List<Line> lines;
    int amountTotal;
    State state;

    Result({
        required this.id,
        required this.name,
        required this.companyName,
        required this.invoiceDate,
        required this.lines,
        required this.amountTotal,
        required this.state,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        companyName: json["company_name"],
        invoiceDate: json["invoice_date"],
        lines: List<Line>.from(json["lines"].map((x) => Line.fromJson(x))),
        amountTotal: json["amount_total"],
        state: stateValues.map[json["state"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "company_name": companyName,
        "invoice_date": invoiceDate,
        "lines": List<dynamic>.from(lines.map((x) => x.toJson())),
        "amount_total": amountTotal,
        "state": stateValues.reverse[state],
    };
}