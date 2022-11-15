// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/address/services/address_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import 'package:amazon_clone/providers/user_provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../constants/global_variable.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;

  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();
  final AddressServices addressServices = AddressServices();

  String addressToBeUsed = "";
  List<PaymentItem> paymentItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentItems.add(PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price));
  }

  @override
  void dispose() {
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void onApplePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
      addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: double.parse(
          widget.totalAmount,
        ),
      );
    }
  }

  void onGPayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
      addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: double.parse(
          widget.totalAmount,
        ),
      );
    }
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";

    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'Error');
      debugPrint("Error!!!!!!!!!!!!!!!");
    }

    // //TODO: Added this to check orders, remove it when deployed
    // addressServices.placeOrder(
    //   context: context,
    //   address: addressToBeUsed,
    //   totalSum: double.parse(
    //     widget.totalAmount,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black12,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: flatBuildingController,
                        hintText: "Flat, House no. Building",
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: areaController,
                        hintText: "Area, Street",
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: pincodeController,
                        hintText: "Pincode",
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: cityController,
                        hintText: "Town/City",
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              ApplePayButton(
                  onPressed: () => payPressed(address),
                  paymentConfigurationAsset: 'applepay.json',
                  onPaymentResult: onApplePayResult,
                  paymentItems: paymentItems,
                  width: double.infinity,
                  type: ApplePayButtonType.buy,
                  height: 50,
                  margin: const EdgeInsets.only(
                    top: 50,
                  ),
                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  )),
              const SizedBox(
                height: 10,
              ),
              GooglePayButton(
                onPressed: () => payPressed(address),
                paymentConfigurationAsset:
                    'default_payment_profile_google_pay.json',
                onPaymentResult: onGPayResult,
                paymentItems: paymentItems,
                width: double.infinity,
                type: GooglePayButtonType.buy,
                height: 50,
                margin: const EdgeInsets.only(top: 50),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
                onError: (error) => showSnackBar(context, error.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
