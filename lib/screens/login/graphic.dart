import 'package:flutter/material.dart';

class GraphicScreen extends StatelessWidget {
  const GraphicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              color: Colors.red,
              height: double.infinity,
            ),
            const Center(
              child: Text(
                "Smart Decisions, Swif Success.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
