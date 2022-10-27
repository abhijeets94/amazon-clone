import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopButton extends StatefulWidget {
  const TopButton({Key? key}) : super(key: key);

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(label: 'Your Orders', onTap: () {}),
            AccountButton(label: 'Top Seller', onTap: () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(label: 'Log Out', onTap: () {}),
            AccountButton(label: 'Your Wishlist', onTap: () {}),
          ],
        ),
      ],
    );
  }
}
