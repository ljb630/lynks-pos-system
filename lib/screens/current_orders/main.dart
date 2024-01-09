import 'package:flutter/material.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/util/constants.dart';
import 'package:lynks_pos_system/util/responsiveness.dart';

class CurrentOrdersScreen extends StatelessWidget {
  const CurrentOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepDarkBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: deepDarkBlue,
        toolbarHeight: 100,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Orders',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'A list of all the orders in tour restro including their name and items',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.indigo.shade600,
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
                onPressed: (() {}),
                child: const Text('Clear orders',
                    style: TextStyle(color: Colors.white))),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.purple.shade600,
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
                onPressed: (() {
                  Navigator.pushNamed(context, homeScreenRoute);
                }),
                child:
                    const Text('Home', style: TextStyle(color: Colors.white))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Colors.indigo.shade600,
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
                onPressed: (() {
                  Navigator.pushNamed(context, customersScreenRoute);
                }),
                child: const Text('Customers',
                    style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: ResponsiveWidget.isSmallScreen(context)
            ? const EdgeInsets.all(10)
            : const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: ResponsiveWidget.isSmallScreen(context)
                ? Axis.horizontal
                : Axis.vertical,
            child: DataTable(
              // columnSpacing: double.infinity,
              columns: const [
                DataColumn(label: Text('SI no')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Table')),
                DataColumn(label: Text('Items')),
                DataColumn(label: Text('Time')),
                DataColumn(label: Text('Order-Id')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(
                    color: MaterialStatePropertyAll(Colors.deepPurple.shade100),
                    cells: [
                      const DataCell(Text('1')),
                      const DataCell(Text('John Doe')),
                      const DataCell(Text('Table 1')),
                      const DataCell(Text('Pizza, Salad')),
                      const DataCell(Text('12:30 PM')),
                      const DataCell(Text('12345')),
                      const DataCell(Text('In Progress')),
                      DataCell(TextButton(
                        onPressed: () {},
                        child: const Text("Remove"),
                      ))
                    ]),
                DataRow(cells: [
                  const DataCell(Text('2')),
                  const DataCell(Text('Jane Smith')),
                  const DataCell(Text('Table 2')),
                  const DataCell(Text('Burger, Fries')),
                  const DataCell(Text('1:45 PM')),
                  const DataCell(Text('67890')),
                  const DataCell(Text('Completed')),
                  DataCell(TextButton(
                    onPressed: () {},
                    child: const Text("Remove"),
                  ))
                ]),
                // Add more rows as needed
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataRow buildDataRow() {
    return const DataRow(cells: [
      DataCell(Text('1')),
      DataCell(Text('John Doe')),
      DataCell(Text('Table 1')),
      DataCell(Text('Pizza, Salad')),
      DataCell(Text('12:30 PM')),
      DataCell(Text('12345')),
      DataCell(Text('In Progress')),
    ]);
  }
}
