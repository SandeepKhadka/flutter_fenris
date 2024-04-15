import 'package:flutter/material.dart';

class PromoCode extends StatefulWidget {
  final void Function(String)?
      onApplyPromoCode; // Callback function declaration

  const PromoCode({Key? key, this.onApplyPromoCode}) : super(key: key);

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  TextEditingController promoCodeController = TextEditingController();

  List<String> promoCodes = [
    'CouponA1',
    'CouponA2',
    'CouponA3',
    'CouponA4',
    'CouponA5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("PromoCode"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              TextField(
                controller: promoCodeController,
                decoration: InputDecoration(
                  labelText: "Enter your PromoCode",
                  hintText: "Promo Code",
                  prefixIcon:
                      Icon(Icons.local_offer, semanticLabel: 'Promocode'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String enteredCode = promoCodeController.text.trim();
                  if (promoCodes.contains(enteredCode)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Promo code applied successfully!')),
                    );
                    widget.onApplyPromoCode?.call(enteredCode);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid promo code!')),
                    );
                  }
                  Navigator.pop(context);
                },
                child: Text('Apply'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
