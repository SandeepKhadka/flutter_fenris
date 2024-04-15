import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Select Payment Method',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Radio(
                    value: 0,
                    groupValue: _selectedIndex,
                    onChanged: (value) {
                      setState(() {
                        _selectedIndex = value as int;
                      });
                    },
                  ),
                  title: Text('Khalti'),
                  trailing: Icon(Icons.payment),
                ),
                Divider(),
                ListTile(
                  leading: Radio(
                    value: 1,
                    groupValue: _selectedIndex,
                    onChanged: (value) {
                      setState(() {
                        _selectedIndex = value as int;
                      });
                    },
                  ),
                  title: Text('Esewa'),
                  trailing: Icon(Icons.payment),
                ),
                Divider(),
                ListTile(
                  leading: Radio(
                    value: 2,
                    groupValue: _selectedIndex,
                    onChanged: (value) {
                      setState(() {
                        _selectedIndex = value as int;
                      });
                    },
                  ),
                  title: Text('Cash on Delivery'),
                  trailing: Icon(Icons.money),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              // Add your functionality for when the "PAY" button is pressed.
            },
            child: Text(
              "PAY",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              textStyle: TextStyle(fontSize: 20),
              elevation: 20,
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Payment(),
  ));
}
