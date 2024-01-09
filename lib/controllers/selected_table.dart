import 'package:get/get.dart';
import 'package:lynks_pos_system/models/customer_details.dart';
import 'package:lynks_pos_system/models/order_modal.dart';

class SelectedTableController extends GetxController {
  Rx<CustomerDetailsModel?> selectedcustomer = Rx<CustomerDetailsModel?>(null);

  bool isCustomerDetailsEmpty() {
    return selectedcustomer.value == null;
  }

  bool isOrderEmpty() {
    return selectedcustomer.value?.orders.isEmpty ?? true;
  }

  void setCustomerDetails(CustomerDetailsModel? customer) {
    selectedcustomer.value = customer;
    print(selectedcustomer.value?.name);
  }

  void clearCustomerDetails() {
    selectedcustomer.value = null;
  }

  int? getItemQuantityByName(String name) {
    final index = selectedcustomer.value?.orders.indexWhere((order) {
      return order.itemName == name;
    });
    if (index != null && index != -1) {
      return selectedcustomer.value?.orders[index].quantity;
    } else {
      return 0;
    }
  }

  void addItemQuantityByName(String name, double price) {
    final index = selectedcustomer.value?.orders.indexWhere((order) {
      return order.itemName == name;
    });
    if (index != null && index != -1) {
      selectedcustomer.value?.orders[index].quantity += 1;
    } else {
      selectedcustomer.value?.orders
          .add(OrderModel(itemName: name, quantity: 1, price: price));
    }
  }

  void decreaseItemQuantityByName(String name) {
    final index = selectedcustomer.value?.orders.indexWhere((order) {
      return order.itemName == name;
    });
    if (index != null && index != -1) {
      if (selectedcustomer.value?.orders[index].quantity == 1) {
        selectedcustomer.value?.orders.removeAt(index);
      } else {
        selectedcustomer.value?.orders[index].quantity -= 1;
      }
    }
  }

  void addItemsToCustomerOrder(OrderModel order) {
    selectedcustomer.value?.orders.add(order);
  }

  String get getCustomerName => selectedcustomer.value?.name ?? "";

  get getCustomerTableNo => selectedcustomer.value?.tableNo ?? -1;
}
