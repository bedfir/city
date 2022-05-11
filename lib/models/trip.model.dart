///{@tool snippet}
/// ```dart
///class Trip {
///  String city;
///  List<String> activities;
///  DateTime date;
///  Trip({
///    required this.city,
///    required this.activities,
///    required this.date,
///  });
///}
/// ```
/// {@end-tool}

class Trip {
  String city;
  List<String> activities;
  DateTime? date;
  Trip({
    required this.city,
    required this.activities,
    required this.date,
  });
}
