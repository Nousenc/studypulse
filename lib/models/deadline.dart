/// One assignment deadline imported from Moodle (mod_assign_get_assignments).
class Deadline {
  Deadline({
    required this.id,
    required this.title,
    required this.courseName,
    required this.dueDate,
    this.done = false,
  });

  final int id;
  final String title;
  final String courseName;
  final DateTime dueDate;
  bool done;

  /// Parses the `courses[].assignments[]` part of the Moodle response.
  static List<Deadline> fromMoodle(Map<String, dynamic> json) {
    final result = <Deadline>[];
    for (final course in json['courses'] as List<dynamic>) {
      for (final a in course['assignments'] as List<dynamic>) {
        final due = a['duedate'] as int;
        if (due == 0) continue; // no deadline set
        result.add(Deadline(
          id: a['id'] as int,
          title: a['name'] as String,
          courseName: course['fullname'] as String,
          dueDate: DateTime.fromMillisecondsSinceEpoch(due * 1000, isUtc: true),
        ));
      }
    }
    result.sort((a, b) => a.dueDate.compareTo(b.dueDate));
    return result;
  }
}
