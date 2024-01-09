import 'package:lynks_pos_system/models/order_modal.dart';

class CustomerDetailsModel {
  int tableNo;
  String name;
  String email;
  String phoneNumber;
  List<OrderModel> orders = [];

  CustomerDetailsModel({
    required this.tableNo,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) {
    return CustomerDetailsModel(
      tableNo: json['tableNo'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "tableNo": tableNo,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
    };
  }
}
