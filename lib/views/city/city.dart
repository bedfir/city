import 'package:flutter/material.dart';

import './widgets/trip_activity_list.dart';
import './widgets/activity_list.dart';
import './widgets/trip_overview.dart';

import '../../models/activity.model.dart';
import '../../models/trip.model.dart';

import '../../datas/data.dart' as data;

class City extends StatefulWidget {
  City({Key? key}) : super(key: key);

  final List<Activity> activities = data.activities;

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  late Trip mytrip;
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
    mytrip = Trip(city: 'Paris', activities: [], date: null);
  }

  /// Getter the object selected in mytrip activities by id
  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  /// setDate Function implement a showDatePicker.
  ///
  /// Then the new date is selected assigne it to mytrip.date
  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(
        const Duration(days: 1),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    ).then(
      (newDate) {
        if (newDate != null) {
          setState(() {
            mytrip.date = newDate;
          });
        }
      },
    );
  }

  /// switchIndex Function Set the index to bottomNavigationBar
  /// and rebuild
  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  /// toggleActivity Funciton take a [String] parametre `id`
  ///
  /// Checked if the id exist in the mytrip.actitivies and toggle
  /// add/remove
  void toggleActivity(String id) {
    setState(() {
      mytrip.activities.contains(id)
          ? mytrip.activities.remove(id)
          : mytrip.activities.add(id);
    });
  }

  /// deleteTripActivity Delete trip activity by id
  void deleteTripActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
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
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: mytrip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                      activities: tripActivities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Decouverte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Mes activitées',
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
