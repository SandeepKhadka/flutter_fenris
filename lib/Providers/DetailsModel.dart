import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Step 2: Define a model class for user profile data
class UserProfile {
  int userId;
  String? userImage;
  String name;
  String email;
  String address;
  String contactNumber;

  UserProfile({
    required this.userId,
    this.userImage,
    required this.name,
    required this.email,
    required this.address,
    required this.contactNumber,
  });
}

// Step 3: Create a ChangeNotifier class to manage the user profile state
class UserProfileProvider extends ChangeNotifier {
  late UserProfile _userProfile;

  UserProfileProvider() {
    // Initialize user profile data
    // You may fetch this data from SharedPreferences or any other source
    _userProfile = UserProfile(
      userId: 0,
      userImage: null,
      name: '',
      email: '',
      address: '',
      contactNumber: '',
    );
  }

  // Getter for accessing the user profile
  UserProfile get userProfile => _userProfile;

  // Method to update user profile
  void updateUserProfile({
    required String name,
    required String email,
    required String address,
    required String contactNumber,
    File? image,
  }) {
    // Update user profile data
    _userProfile = UserProfile(
      userId: _userProfile.userId,
      userImage: image != null ? image.path : _userProfile.userImage,
      name: name,
      email: email,
      address: address,
      contactNumber: contactNumber,
    );

    // Notify listeners of the change
    notifyListeners();
  }
}

class MyDetails extends StatelessWidget {
  const MyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProfileProvider(),
      child: _MyDetailsWidget(),
    );
  }
}

class _MyDetailsWidget extends StatefulWidget {
  @override
  _MyDetailsWidgetState createState() => _MyDetailsWidgetState();
}

class _MyDetailsWidgetState extends State<_MyDetailsWidget> {
  late UserProfileProvider _userProfileProvider;

  @override
  void initState() {
    super.initState();
    _userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            children: [
              Text('User Profile: ${_userProfileProvider.userProfile.name}'),
              ElevatedButton(
                onPressed: () {
                  _userProfileProvider.updateUserProfile(
                    name: 'John Doe',
                    email: 'john@example.com',
                    address: '123 Main Street',
                    contactNumber: '1234567890',
                    image: null, // Provide image if available
                  );
                },
                child: Text('Update Profile'),
              ),
              // Your UI code here
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyDetails(),
  ));
}
