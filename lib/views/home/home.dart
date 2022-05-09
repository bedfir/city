import 'package:flutter/material.dart';
import 'package:material/views/home/widgets/city_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {
      'name': 'Paris',
      'image': 'assets/images/rennes.jpg',
      'checked': false,
    },
    {
      'name': 'Monastir',
      'image': 'assets/images/monastir.jpg',
      'checked': false,
    },
    {
      'name': 'Valladolid',
      'image': 'assets/images/valladolid.jpg',
      'checked': false,
    },
  ];

  void switchChecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('dymatrip'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map((city) {
              return CityCard(
                name: city['name'],
                image: city['image'],
                checked: city['checked'],
                updateChecked: () {
                  switchChecked(city);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
