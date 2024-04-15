import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/PlaceOrder/confirm.dart';
import 'package:keyboard/controller/user_Controller.dart';
import 'package:khalti/khalti.dart';

import '../controller/Buy_Product_Controller.dart';

class KhaltiExampleApp extends StatelessWidget {
  final double totalPrice;
  final List<dynamic> productJsonData;
  final String address;

  const KhaltiExampleApp(
      {Key? key,
      required this.totalPrice,
      required this.productJsonData,
      required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Khalti Payment'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Wallet Payment'),
              Tab(text: 'EBanking'),
              Tab(text: 'MBanking'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WalletPayment(
              productJsonData: productJsonData,
              totalPrice: totalPrice,
              address: address,
            ),
            Banking(paymentType: PaymentType.eBanking),
            Banking(paymentType: PaymentType.mobileCheckout),
          ],
        ),
      ),
    );
  }
}

class WalletPayment extends StatefulWidget {
  final List<dynamic> productJsonData;
  final double totalPrice;
  final String address;

  const WalletPayment(
      {Key? key,
      required this.productJsonData,
      required this.totalPrice,
      required this.address})
      : super(key: key);

  @override
  State<WalletPayment> createState() => _WalletPaymentState();
}

class _WalletPaymentState extends State<WalletPayment> {
  late final TextEditingController _mobileController, _pinController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
    _pinController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            validator: (v) => (v?.isEmpty ?? true) ? 'Required ' : null,
            decoration: const InputDecoration(
              label: Text('Mobile Number'),
            ),
            controller: _mobileController,
          ),
          TextFormField(
            validator: (v) => (v?.isEmpty ?? true) ? 'Required ' : null,
            decoration: const InputDecoration(
              label: Text('Khalti MPIN'),
            ),
            controller: _pinController,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _isLoading ? null : _initiatePayment,
            child: _isLoading
                ? CircularProgressIndicator()
                : Text('PAY Rs. ${widget.totalPrice}'),
          ),
        ],
      ),
    );
  }

  void _initiatePayment() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _isLoading = true;
    });
    var data = {
      "user_id": Get.find<UserController>().id.toString(),
      "payment_method": "khalti",
      "total_amount": widget.totalPrice.toStringAsFixed(2),
      "delivery_address": widget.address,
      "products": widget.productJsonData
    };

    // Get.to(OrderSuccessful());

    final messenger = ScaffoldMessenger.maybeOf(context);
    final initiationModel = await Khalti.service.initiatePayment(
      request: PaymentInitiationRequestModel(
        amount: 1000,
        mobile: _mobileController.text,
        productIdentity: 'mac-mini',
        productName: 'Apple Mac Mini',
        transactionPin: _pinController.text,
        productUrl: 'https://khalti.com/bazaar/mac-mini-16-512-m1',
        additionalData: {
          'vendor': 'Oliz Store',
          'manufacturer': 'Apple Inc.',
        },
      ),
    );

    final otpCode = await _showOTPSentDialog();

    if (otpCode != null) {
      try {
        final model = await Khalti.service.confirmPayment(
          request: PaymentConfirmationRequestModel(
            confirmationCode: otpCode,
            token: initiationModel.token,
            transactionPin: _pinController.text,
          ),
        );

        debugPrint(model.toString());
        Get.put(BuyController().add(data));
        Get.to(OrderSuccessful());
      } catch (e) {
        messenger?.showSnackBar(
          SnackBar(content: Text("Invalid MPIN")),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<String?> _showOTPSentDialog() {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        String? otp;
        return AlertDialog(
          title: const Text('OTP Sent!'),
          content: TextField(
            decoration: const InputDecoration(
              label: Text('OTP Code'),
            ),
            onChanged: (v) => otp = v,
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context, otp),
            )
          ],
        );
      },
    );
  }
}

class Banking extends StatefulWidget {
  const Banking({Key? key, required this.paymentType}) : super(key: key);

  final PaymentType paymentType;

  @override
  State<Banking> createState() => _BankingState();
}

class _BankingState extends State<Banking> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder<BankListModel>(
      future: Khalti.service.getBanks(paymentType: widget.paymentType),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final banks = snapshot.data!.banks;
          return ListView.builder(
            itemCount: banks.length,
            itemBuilder: (context, index) {
              final bank = banks[index];

              return ListTile(
                leading: SizedBox.square(
                  dimension: 40,
                  child: Image.network(bank.logo),
                ),
                title: Text(bank.name),
                subtitle: Text(bank.shortName),
                onTap: () async {
                  final mobile = await showDialog<String>(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      String? mobile;
                      return AlertDialog(
                        title: const Text('Enter Mobile Number'),
                        content: TextField(
                          decoration: const InputDecoration(
                            label: Text('Mobile Number'),
                          ),
                          onChanged: (v) => mobile = v,
                        ),
                        actions: [
                          SimpleDialogOption(
                            child: const Text('OK'),
                            onPressed: () => Navigator.pop(context, mobile),
                          )
                        ],
                      );
                    },
                  );

                  if (mobile != null) {
                    final url = Khalti.service.buildBankUrl(
                      bankId: bank.idx,
                      amount: 1000,
                      mobile: mobile,
                      productIdentity: 'macbook-pro-21',
                      productName: 'Macbook Pro 2021',
                      paymentType: widget.paymentType,
                      returnUrl: 'https://khalti.com',
                    );
                    // url_launcher.launchUrl(Uri.parse(url));
                  }
                },
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
