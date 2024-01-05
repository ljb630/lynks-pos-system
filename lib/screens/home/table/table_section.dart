import 'package:flutter/material.dart';
import 'package:lynks_pos_system/util/constants.dart';

class TableSection extends StatefulWidget {
  const TableSection({super.key});

  @override
  State<TableSection> createState() => _TableSectionState();
}

class _TableSectionState extends State<TableSection> {
  final TextEditingController _textFieldController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldController.addListener(() {
      print("Text field: ${_textFieldController.text}");
    });
  }

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
    _textFieldController.clear();
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
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                      hintText: "Name", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 5),
                const TextField(
                  // controller: _textFieldController,
                  decoration: InputDecoration(
                      hintText: "E-mail", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 5),
                const TextField(
                  decoration: InputDecoration(
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
                  Navigator.pop(context);
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
