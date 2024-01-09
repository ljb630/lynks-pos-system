class OrderModel {
  String itemName;
  int quantity;
  double price;
  String? note;

  OrderModel({
    required this.itemName,
    required this.quantity,
    required this.price,
    this.note,
  });
}
