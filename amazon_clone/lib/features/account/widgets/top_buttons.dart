import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopButton extends StatefulWidget {
  const TopButton({Key? key}) : super(key: key);

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  AccountServices accountServices = AccountServices();
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
            AccountButton(
              label: 'Log Out',
              onTap: () => accountServices.logOut(context),
            ),
            AccountButton(label: 'Your Wishlist', onTap: () {}),
          ],
        ),
      ],
    );
  }
}
