import 'package:flutter/material.dart';
import 'package:material/views/city/widgets/trip_activity.card.dart';
import '../../../models/activity.model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList({
    Key? key,
    required this.activities,
    required this.deleteTripActivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: activities
            .map(
              (activity) => TripActivityCard(
                  key: ValueKey(activity.id),
                  activity: activity,
                  deleteTripActivity: deleteTripActivity),
            )
            .toList(),
      ),
    );
  }
}
