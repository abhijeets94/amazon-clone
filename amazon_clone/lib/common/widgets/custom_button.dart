import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onTap,

      style: const NeumorphicStyle(
        shape: NeumorphicShape.flat,
        color: Colors.black,
      ),
      child: Container(
        width: double.maxFinite,
        height: 30,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      // style: ElevatedButton.styleFrom(
      //   minimumSize: const Size(
      //     double.infinity,
      //     50,
      //   ),
      //   primary: color,
      // ),
    );
  }
}
