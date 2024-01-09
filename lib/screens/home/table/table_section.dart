import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/selected_table.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';
import 'package:lynks_pos_system/models/customer_details.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/util/constants.dart';
import 'package:lynks_pos_system/util/responsiveness.dart';

class TableSection extends StatefulWidget {
  const TableSection({super.key});

  @override
  State<TableSection> createState() => _TableSectionState();
}

class _TableSectionState extends State<TableSection> {
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _phoneFieldController = TextEditingController();

  final TabbleToggleController _controller = Get.find();
  // final SelectedTableController _selectedTableController = Get.find();

  CustomerDetailsModel getCoustomerDetails(int index) {
    return CustomerDetailsModel(
        name: _nameFieldController.text,
        email: _emailFieldController.text,
        phoneNumber: _phoneFieldController.text,
        tableNo: index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return GridView.count(
        crossAxisCount: ResponsiveWidget.isSmallScreen(context)
            ? 1
            : ResponsiveWidget.isMediumScreen(context)
                ? 3
                : 4,
        childAspectRatio: 1.8,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        padding: const EdgeInsets.all(10),
        children: List.generate(
          totalTables,
          (index) {
            return GestureDetector(
              onTap: () {
                _displayTextInputDialog(context, index + 1);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors
                    .primaries[(index * 5) % Colors.primaries.length].shade600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Table ${index + 1}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Text("Status → vacant")
                  ],
                ),
              ),
            );
          },
        ));
  }

  Future<void> _displayTextInputDialog(BuildContext context, int index) async {
    _nameFieldController.clear();
    _emailFieldController.clear();
    _phoneFieldController.clear();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Customer Details of Table $index',
            style: const TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  controller: _nameFieldController,
                  decoration: const InputDecoration(
                      hintText: "Name", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 5),
                TextField(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  controller: _emailFieldController,
                  decoration: const InputDecoration(
                      hintText: "E-mail", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _phoneFieldController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                      hintText: "Phone no", border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              color: deepDarkBlue,
              child: TextButton(
                onPressed: () {
                  _controller.setCustomerDetails(getCoustomerDetails(index));
                  print(_controller.selectedCustomer.value!.name);
                  Navigator.of(context).pop();

                  _controller.changeTable();
                },
                child: const Text(
                  'Next ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
