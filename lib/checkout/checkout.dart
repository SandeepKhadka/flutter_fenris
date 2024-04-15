import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Login/success.dart';
import 'package:keyboard/PlaceOrder/confirm.dart';
import 'package:keyboard/PlaceOrder/final_order.dart';
import 'package:keyboard/checkout/promocode.dart';
import 'package:keyboard/controller/user_Controller.dart';
import 'package:keyboard/model/userDetails.dart';
import 'package:keyboard/payment/khalti.dart';

import '../controller/Buy_Product_Controller.dart';

class Checkout extends StatefulWidget {
  final int totalPrice;
  final List<dynamic> productJsonData;

  const Checkout({
    Key? key,
    required this.totalPrice,
    required this.productJsonData,
  }) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late TextEditingController addressController = TextEditingController();
  String selectedLocation = '';
  bool promoCodeApplied = false;
  double discountPercentage = 0.1; // 10% discount
  String paymentMethod = '';
  List<String> validPromoCodes = ['CODE1', 'CODE2', 'CODE3', 'CODE4', 'CODE5'];
  Set<String> appliedPromoCodes = {};

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Delivery Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildDeliveryInfo(),
              SizedBox(height: 20),
              Text(
                'Payment Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildPaymentInfo(),
              SizedBox(height: 20),
              Text(
                'Order Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildOrderSummary(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _placeOrder,
                child: Text(
                  paymentMethod == 'Khalti' ? 'Continue Khalti' : 'Place Order',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return GestureDetector(
      onTap: _showAddressDialog,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.location_on),
              Expanded(
                child: Text(
                  selectedLocation.isNotEmpty
                      ? selectedLocation
                      : 'Enter Address',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentInfo() {
    return GestureDetector(
      onTap: _showPaymentOptions,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.payment),
              Expanded(
                child: Text(
                  paymentMethod.isNotEmpty
                      ? paymentMethod
                      : 'Select Payment Method',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    double discountedPrice = widget.totalPrice.toDouble();
    if (promoCodeApplied) {
      discountedPrice -= widget.totalPrice * discountPercentage;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Total Cost'),
              trailing: Text(
                'Rs ${discountedPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            if (promoCodeApplied)
              ListTile(
                title: Text('Promo Code Discount'),
                trailing: Text(
                  '10% P.C applied',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            if (!promoCodeApplied) // Only show if promo code not applied
              ListTile(
                title: Text('Promo Code'),
                trailing: ElevatedButton(
                  onPressed: _showPromoCodeDialog,
                  child: Text('Apply Promo Code'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _placeOrder() {
    if (selectedLocation.isNotEmpty && paymentMethod.isNotEmpty) {
      if (paymentMethod == 'Khalti') {
        Get.to(KhaltiExampleApp(
          totalPrice: widget.totalPrice.toDouble(),
          address: selectedLocation,
          productJsonData: widget.productJsonData,
        ));
      } else {
        var data = {
          "user_id": Get.find<UserController>().id.toString(),
          "payment_method": paymentMethod,
          "total_amount": widget.totalPrice.toDouble().toStringAsFixed(2),
          "delivery_address": selectedLocation,
          "products": widget.productJsonData
        };
        print(data);
        Get.put(BuyController().add(data));
        Get.to(OrderSuccessful());
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(selectedLocation.isEmpty
              ? 'Please enter address.'
              : 'Please select payment method.'),
        ),
      );
    }
  }

  void _showAddressDialog() async {
    final enteredAddress = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Enter Address"),
        content: TextField(
          controller: addressController,
          decoration: InputDecoration(
            hintText: "Enter your full address",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                selectedLocation = addressController.text;
              });
              Navigator.pop(context, selectedLocation);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );

    if (enteredAddress != null) {
      setState(() {
        selectedLocation = enteredAddress;
      });
    }
  }

  void _showPaymentOptions() async {
    final selectedPayment = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select Payment Method"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  paymentMethod = "cod";
                });
                Navigator.pop(context, paymentMethod);
              },
              child: Text("cod"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  paymentMethod = "Khalti";
                });
                Navigator.pop(context, paymentMethod);
              },
              child: Text("Khalti"),
            ),
          ],
        ),
      ),
    );

    if (selectedPayment != null) {
      setState(() {
        paymentMethod = selectedPayment;
      });
    }
  }

  void _showPromoCodeDialog() async {
    if (appliedPromoCodes.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You have already applied a promo code!'),
        ),
      );
      return;
    }

    final TextEditingController promoCodeController =
        TextEditingController(); // Create controller for promo code TextField
    final appliedPromoCode = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Apply Promo Code"),
        content: TextField(
          controller: promoCodeController, // Assign controller to TextField
          decoration: InputDecoration(hintText: "Enter promo code"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Apply promo code logic here
              final enteredPromoCode = promoCodeController.text
                  .trim(); // Access text from TextField controller
              if (enteredPromoCode.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter a promo code!'),
                  ),
                );
              } else if (validPromoCodes.contains(enteredPromoCode) &&
                  !appliedPromoCodes.contains(enteredPromoCode)) {
                setState(() {
                  promoCodeApplied = true;
                  appliedPromoCodes.add(enteredPromoCode);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Promo code applied successfully!'),
                  ),
                );
              } else if (appliedPromoCodes.contains(enteredPromoCode)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You have already applied this promo code!'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Invalid promo code!'),
                  ),
                );
              }
              Navigator.pop(context);
            },
            child: Text("Apply"),
          ),
        ],
      ),
    );

    if (appliedPromoCode != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Promo code applied successfully!'),
        ),
      );
    }
  }
}
