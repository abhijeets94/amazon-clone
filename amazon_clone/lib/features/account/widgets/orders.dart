import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:amazon_clone/features/order_details/screens/order_details.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? order;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrder();
  }

  void fetchOrder() async {
    order = await accountServices.fetchMyOrders(context: context);
    setState(() {});
    debugPrint("order is $order");
  }

  @override
  Widget build(BuildContext context) {
    return order == null
        ? const Loader()
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Your Orders",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: GlobalVariables.selectedNavBarColor,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20, right: 0),
                child: Container(
                    height: 170,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: order!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, OrderDetailsScreen.routeName,
                                  arguments: order![index]);
                            },
                            child: SingleProduct(
                                image: order![index].products[0].images[0]),
                          );
                        })),
              ),
            ],
          );
  }
}
