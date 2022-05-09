import 'package:flutter/material.dart';

import 'package:material/models/activity.model.dart';
import 'package:material/datas/data.dart' as data;
import 'package:material/models/trip.model.dart';
import 'package:material/views/city/widgets/trip_overview.dart';
import '../../views/city/widgets/activity_card.dart';

class City extends StatefulWidget {
  City({Key? key}) : super(key: key);

  final List<Activity> activities = data.activities;

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  Trip mytrip = Trip(city: 'Paris', activities: [], date: DateTime.now());

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(
        const Duration(days: 1),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Organisation voyage'),
        actions: const <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TripOverview(setDate: setDate, trip: mytrip),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                crossAxisCount: 2,
                children: widget.activities
                    .map(
                      (activity) => ActivityCard(
                        activity: activity,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
