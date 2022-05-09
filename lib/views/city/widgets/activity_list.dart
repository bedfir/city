import 'package:flutter/material.dart';
import './activity_card.dart';
import '../../../models/activity.model.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  const ActivityList({
    Key? key,
    required this.activities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      crossAxisCount: 2,
      children: activities
          .map(
            (activity) => ActivityCard(
              activity: activity,
            ),
          )
          .toList(),
    );
  }
}
