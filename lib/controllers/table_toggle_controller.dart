import 'package:get/get.dart';
import 'package:lynks_pos_system/models/customer_details.dart';
import 'package:lynks_pos_system/models/order_modal.dart';

class TabbleToggleController extends GetxController {
  RxBool isTable = true.obs;
  static CustomerDetailsModel emptyCustomerDetails =
      CustomerDetailsModel(name: "", email: "", phoneNumber: "", tableNo: -1);
  Rx<CustomerDetailsModel> selectedCustomer = emptyCustomerDetails.obs;

  void changeTable(CustomerDetailsModel customer) {
    setCustomerDetails(customer);
    isTable.value = !isTable.value;
    print(isTable);
  }

  void bakcToTable() {
    isTable.value = !isTable.value;
  }

  bool isCustomerDetailsEmpty() {
    return selectedCustomer.value.tableNo == -1;
  }

  bool isOrderEmpty() {
    return selectedCustomer.value.orders.isEmpty;
  }

  void setCustomerDetails(CustomerDetailsModel customer) {
    selectedCustomer.value = customer;
    print(selectedCustomer.value.name);
  }

  void clearCustomerDetails() {
    selectedCustomer.value = emptyCustomerDetails;
  }

  int getItemQuantityByName(String name) {
    final index = selectedCustomer.value.orders.indexWhere((order) {
      return order.itemName == name;
    });
    if (index != -1) {
      return selectedCustomer.value.orders[index].quantity;
    } else {
      return 0;
    }
  }

  void addItemQuantityByName(String name, double price) {
    final index = selectedCustomer.value.orders.indexWhere((order) {
      return order.itemName == name;
    });
    // print("added item $name");
    if (index != -1) {
      selectedCustomer.value.orders[index].quantity += 1;
      selectedCustomer.value.orders[index].price += price;
    } else {
      selectedCustomer.value.orders
          .add(OrderModel(itemName: name, quantity: 1, price: price));
    }
    selectedCustomer.refresh();
  }

  void decreaseItemQuantityByName(String name) {
    final index = selectedCustomer.value.orders.indexWhere((order) {
      return order.itemName == name;
    });
    if (index != -1) {
      if (selectedCustomer.value.orders[index].quantity == 1) {
        selectedCustomer.value.orders.removeAt(index);
      } else {
        selectedCustomer.value.orders[index].quantity -= 1;
        selectedCustomer.value.orders[index].price -=
            selectedCustomer.value.orders[index].price;
      }
    }
    selectedCustomer.refresh();
  }

  void addItemsToCustomerOrder(OrderModel order) {
    selectedCustomer.value.orders.add(order);
  }

  double getTotalPrice() {
    double total = 0;
    for (var order in selectedCustomer.value.orders) {
      total += order.price;
    }
    return total;
  }

  void removeItemByName(String name) {
    final index = selectedCustomer.value.orders.indexWhere((order) {
      return order.itemName == name;
    });
    if (index != -1) {
      selectedCustomer.value.orders.removeAt(index);
    }
    selectedCustomer.refresh();
  }

  String getCustomerName() => selectedCustomer.value.name;

  get getCustomerTableNo => selectedCustomer.value.tableNo;
}
