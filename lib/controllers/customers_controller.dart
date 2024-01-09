import 'package:get/get.dart';
import 'package:lynks_pos_system/models/customer_details.dart';
import 'package:lynks_pos_system/models/order_modal.dart';

class CustomersController extends GetxController {
  RxList<CustomerDetailsModel> customers = <CustomerDetailsModel>[].obs;

  void isEmpty() {
    customers.isEmpty;
  }

  void addCustomer(CustomerDetailsModel customer) {
    print(customer.tableNo);
    customers.add(customer);
  }

  void removeCustomer(CustomerDetailsModel customer) {
    customers.remove(customer);
  }

  CustomerDetailsModel? findCustomerByTableNo(int tableNo) {
    return customers.firstWhere((customer) => customer.tableNo == tableNo,
        orElse: () => CustomerDetailsModel(
            tableNo: -1, name: "", email: "", phoneNumber: ""));
  }

  List<CustomerDetailsModel> findCustomersByName(String name) {
    return customers.where((customer) => customer.name.contains(name)).toList();
  }

  void clearCustomers() {
    customers.clear();
  }

  void updateCustomerOrders(
      CustomerDetailsModel customer, List<OrderModel> newOrders) {
    final index = customers.indexOf(customer);
    if (index != -1) {
      customers[index].orders = newOrders;
    }
  }
}
