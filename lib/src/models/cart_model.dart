class CartModel {
  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExite,
    this.time,
  });

  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExite;
  DateTime? time;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        img: json["img"],
        quantity: json["quantity"],
        isExite: json["isExite"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "img": img,
        "quantity": quantity,
        "isExite": isExite,
        "time": time,
      };
}
