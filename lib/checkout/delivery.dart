import 'package:flutter/material.dart';
import 'package:keyboard/deliveryWidgets/butuwal.dart';
import 'package:keyboard/deliveryWidgets/chitwan.dart';
import 'package:keyboard/deliveryWidgets/kathmandu.dart';

import 'package:keyboard/deliveryWidgets/pokhara.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  List<String> places = [
    'Pokhara',
    'Kathmandu',
    'Butwal',
    'Chitwan',
    'Bhairawa',
  ];

  List<String> filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    filteredPlaces = places;
  }

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
        title: Text('Select Location'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10), // Added SizedBox for spacing
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            filteredPlaces = places
                                .where((place) => place
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Search Your Location",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPlaces.length,
              itemBuilder: (context, index) {
                final place = filteredPlaces[index];
                return ListTile(
                  title: Text(place),
                  onTap: () {
                    switch (place) {
                      case 'Pokhara':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PokharaPlaces()),
                        );
                        break;
                      case 'Kathmandu':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Kathmandu()),
                        );
                        break;
                      case 'Butwal':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Butwal()),
                        );
                        break;
                      case 'Chitwan':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Chitwan()),
                        );
                        break;
                      case 'Bhairawa':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PokharaPlaces()),
                        );
                        break;
                      default:
                        Navigator.pop(context, place);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SelectLocation(),
  ));
}
