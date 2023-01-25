import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType? textInputType;
  final int maxLines;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.textInputType,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),

      // boxShape: NeumorphicBoxShape.stadium(),
      style: NeumorphicStyle(
        depth: NeumorphicTheme.embossDepth(context),
        shape: NeumorphicShape.convex,
      ),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 18),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText, border: InputBorder.none,
          // border: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.transparent,
          //   ),
          // ),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.transparent,
          //   ),
          // ),
        ),
        obscureText: obscureText,
        keyboardType: textInputType,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hintText';
          }
          return null;
        },
        maxLines: maxLines,
      ),
    );
  }
}
