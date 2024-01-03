import 'package:flutter/material.dart';

class GraphicScreen extends StatelessWidget {
  const GraphicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.red,
        ),
        const Center(
          child: Text(
            "Smart Decisions, Swif Success.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
