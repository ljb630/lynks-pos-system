import 'package:flutter/material.dart';
import 'package:restaurant_pos/util/constants.dart';

class TableSection extends StatefulWidget {
  const TableSection({super.key});

  @override
  State<TableSection> createState() => _TableSectionState();
}

class _TableSectionState extends State<TableSection> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1.8,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        padding: const EdgeInsets.all(10),
        children: List.generate(
          totalTables,
          (index) {
            return Container(
              color: Colors
                  .primaries[(index * 5) % Colors.primaries.length].shade600,
              child: Center(
                child: Text(
                  'Table ${index + 1}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
