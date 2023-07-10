import 'package:hive_flutter/hive_flutter.dart';

import 'package:hive/hive.dart';

@HiveType(typeId: 0) // Unique ID for the Hive Type
class ProductData extends HiveObject {
  @HiveField(0)
  final int product_id;

  @HiveField(1)
  final int product_uom_qty;

  @HiveField(2)
  final double unit_price;

  ProductData({
    required this.product_id,
    required this.product_uom_qty,
    required this.unit_price,
  });
}

class ProductDataAdapter extends TypeAdapter<ProductData> {
  @override
  final int typeId = 0; // Unique ID for the adapter

  @override
  ProductData read(BinaryReader reader) {
    return ProductData(
      product_id: reader.readInt(),
      product_uom_qty: reader.readInt(),
      unit_price: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductData obj) {
    writer.writeInt(obj.product_id);
    writer.writeInt(obj.product_uom_qty);
    writer.writeDouble(obj.unit_price);
  }
}
