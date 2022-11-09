import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../constants/global_variable.dart';
import '../../../../constants/utils.dart';
import '../../../../models/product.dart';
import 'package:http/http.dart' as http;

import '../../../models/user.dart';

class ProductDetailsServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    debugPrint("product id = ${product.id.runtimeType}");

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'id': product.id!,
          },
        ),
      );
      debugPrint("added successfully");

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // showSnackBar(context, "Rating added successfully!");
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          debugPrint("User : ${user.cart}");

          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void rateProduct(
      {required BuildContext context,
      required Product product,
      required double rating}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    debugPrint("product id = ${product.id.runtimeType}");

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'id': product.id!,
            'rating': rating,
          },
        ),
      );
      debugPrint("Rating added successfully");

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // showSnackBar(context, "Rating added successfully!");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
