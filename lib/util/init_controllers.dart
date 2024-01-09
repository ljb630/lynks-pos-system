import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/customers_controller.dart';
import 'package:lynks_pos_system/controllers/selected_table.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';

Future<void> init() async {
  Get.put(TabbleToggleController());
  Get.put(SelectedTableController());
  Get.put(CustomersController());
}
