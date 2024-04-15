import 'package:flutter/material.dart';

class Kathmandu extends StatefulWidget {
  @override
  _PokharaPlacesState createState() => _PokharaPlacesState();
}

class _PokharaPlacesState extends State<Kathmandu> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    List<String> pokharaPlaces = [
      'Arba',
      'Bagar',
      'Batulechaur',
      'Rambazar',
      'Newroad',
      'Nayabazar',
      // Add more places here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Places in Pokhara'),
      ),
      body: ListView.builder(
        itemCount: pokharaPlaces.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Radio(
              value: index,
              groupValue: _selectedIndex,
              onChanged: (int? value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
            ),
            title: Text(pokharaPlaces[index]),
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}

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
                    Icon(Icons.filter_list),
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
                    if (place == 'Pokhara') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Kathmandu()),
                      );
                    } else {
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
