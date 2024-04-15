import 'package:flutter/material.dart';

class PromoCodeScreen extends StatefulWidget {
  final Function(String)? onApplyPromoCode;

  const PromoCodeScreen({Key? key, this.onApplyPromoCode}) : super(key: key);

  @override
  _PromoCodeScreenState createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
  final TextEditingController _promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Promo Code'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _promoCodeController,
              decoration: InputDecoration(
                labelText: 'Promo Code',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String promoCode = _promoCodeController.text.trim();
                if (promoCode.isNotEmpty) {
                  widget.onApplyPromoCode?.call(promoCode);
                  Navigator.pop(context);
                }
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
