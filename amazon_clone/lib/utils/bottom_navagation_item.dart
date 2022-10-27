import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavigationItems extends StatelessWidget {
  final int page;
  final double bottomNavigationBarWidth;
  final double bottomBarBorderWidth;
  final IconData icons;
  final Color? color;

  const BottomNavigationItems(
      {Key? key,
      required this.page,
      required this.bottomBarBorderWidth,
      required this.bottomNavigationBarWidth,
      required this.icons,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("Page is $page");
    return Container(
      width: bottomNavigationBarWidth,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: color!,
            width: bottomBarBorderWidth,
          ),
        ),
      ),
      child: Icon(icons),
    );
  }
}
