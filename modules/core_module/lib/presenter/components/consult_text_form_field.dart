import 'package:flutter/material.dart';

class ConsultTextFormField extends StatelessWidget {
  final String label;
  String? hintText;
  String? initialvalue;
  String? Function(String?)? validator;
  bool obscureText;
  ValueNotifier<bool>? isScrollableNotifier;

  ConsultTextFormField({
    super.key,
    required this.label,
    this.hintText,
    this.initialvalue,
    this.validator,
    this.obscureText = false,
    this.isScrollableNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        if (isScrollableNotifier != null) {
           isScrollableNotifier!.value = value;
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: obscureText,
            initialValue: initialvalue,
            style: const TextStyle(color: Colors.black),
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(left: 12),
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
      ),
    );
  }
}
