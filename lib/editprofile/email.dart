import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailProvider extends ChangeNotifier {
  String _name = '';

  String get name => _name;

  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmailProvider(),
      child: _NameWidget(),
    );
  }
}

class _NameWidget extends StatefulWidget {
  @override
  __NameWidgetState createState() => __NameWidgetState();
}

class __NameWidgetState extends State<_NameWidget> {
  final TextEditingController emailController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final nameProvider = Provider.of<EmailProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 90),
              Image.asset(
                "assets/edit.png",
                height: 350,
                width: 350,
              ),
              SizedBox(height: 10),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                onChanged: (_) {
                  setState(() {
                    _errorMessage = null;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Enter Your Name",
                  prefixIcon: Icon(Icons.person, semanticLabel: "Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80.0),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  errorText: _errorMessage,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                    return 'Please enter a valid Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty ||
                      !RegExp(r"^[a-zA-Z\s]+$")
                          .hasMatch(emailController.text)) {
                    setState(() {
                      _errorMessage = 'Please enter a valid Name';
                    });
                  } else {
                    // Set name using EmailProvider
                    nameProvider.setName(emailController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Name changed'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  elevation: 20,
                  shadowColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
