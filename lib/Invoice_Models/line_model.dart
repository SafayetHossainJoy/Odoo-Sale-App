class Line {
    int productId;
    String productName;
    int productQty;
    int priceUnit;
    int priceSubtotal;

    Line({
        required this.productId,
        required this.productName,
        required this.productQty,
        required this.priceUnit,
        required this.priceSubtotal,
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