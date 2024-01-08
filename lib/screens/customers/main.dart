import 'package:flutter/material.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/util/constants.dart';
import 'package:lynks_pos_system/util/responsiveness.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepDarkBlue,
      appBar: AppBar(
        backgroundColor: deepDarkBlue,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Customers',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'A list of all customers',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                color: Colors.indigo.shade600,
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
                onPressed: (() {}),
                child: const Text('Clear ',
                    style: TextStyle(color: Colors.white))),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
            decoration: BoxDecoration(
                color: Colors.indigo.shade600,
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
                onPressed: (() {
                  Navigator.pushNamed(context, currentOrdersScreenRoute);
                }),
                child: const Text('Orders',
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
          physics: const BouncingScrollPhysics(),
          child: SingleChildScrollView(
            scrollDirection: ResponsiveWidget.isSmallScreen(context) ||
                    ResponsiveWidget.isMediumScreen(context)
                ? Axis.horizontal
                : Axis.vertical,
            child: DataTable(
              showBottomBorder: false,
              border: TableBorder.symmetric(
                  inside: BorderSide.none, outside: BorderSide.none),
              columns: const [
                DataColumn(label: Text('SI no')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Phone')),
                DataColumn(label: Text('Payment')),
                DataColumn(label: Text('Order-Id')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(
                    color: const MaterialStatePropertyAll(
                        Color.fromARGB(105, 150, 146, 156)),
                    cells: [
                      const DataCell(Text('1')),
                      const DataCell(Text('John Doe')),
                      const DataCell(Text('Table 1')),
                      const DataCell(Text('Pizza, Salad')),
                      const DataCell(Text('12:30 PM')),
                      const DataCell(Text('12345')),
                      DataCell(TextButton(
                        onPressed: () {},
                        child: const Text("Remove"),
                      ))
                    ]),
                DataRow(
                    color: const MaterialStatePropertyAll(
                        Color.fromARGB(105, 150, 146, 156)),
                    cells: [
                      const DataCell(Text('2')),
                      const DataCell(Text('Jane Smith')),
                      const DataCell(Text('Table 2')),
                      const DataCell(Text('Burger, Fries')),
                      const DataCell(Text('1:45 PM')),
                      const DataCell(Text('67890')),
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
