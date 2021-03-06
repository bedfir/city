import 'package:flutter/material.dart';
import './activity_card.dart';
import '../../../models/activity_model.dart';

///  {@tool snippet}
///
/// The following is an exemple of a stateless widget
/// subclass called `ActivityList`.
///
/// Normally, widgets have more constructor arguments, each of which corresponds
/// to a `final` property.
///
/// The constructor required activities a List<[Activity]>
///
/// ```dart
/// class GreenFrog extends StatelessWidget {
///   const ActivityList({
///   Key? key,
///   List<Activity> required this.activities
/// }) : super(key: key);
///
///   @override
///   Widget build(BuildContext context) {
///     return GridView(children: activities
///          .map(
///            (activity) => ActivityCard(
///              activity: activity,
///           ),
///         ).toList(),
///        );
///     }
/// }
/// ```
/// {@end-tool}
class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final List<String> selectedActivities;
  final Function toggleActivity;

  const ActivityList({
    Key? key,
    required this.activities,
    required this.selectedActivities,
    required this.toggleActivity,
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
              isSelected: selectedActivities.contains(activity.id),
              toggleActivity: () {
                toggleActivity(activity.id);
              },
            ),
          )
          .toList(),
    );
  }
}
