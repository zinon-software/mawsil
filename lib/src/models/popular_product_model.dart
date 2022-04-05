
import 'dart:convert';

import 'product_model.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.totalSize,
        this.typeId,
        this.offset,
        this.products,
    });

    int? totalSize;
    int? typeId;
    int? offset;
    List<ProductModel>? products;

    List<ProductModel> get getProducts => products!;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        totalSize: json["total_size"],
        typeId: json["type_id"],
        offset: json["offset"],
        products: List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "type_id": typeId,
        "offset": offset,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}