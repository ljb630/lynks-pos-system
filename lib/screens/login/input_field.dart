import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.obscureText ? 'Password' : 'E-mail',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          obscureText: widget.obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            fillColor: Colors.grey.shade200,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            suffixIcon: widget.obscureText
                ? Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(width: 1, color: Colors.grey))),
                    child: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
