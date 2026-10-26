import '../models/deadline.dart';

/// Plans local reminders 3 days and 1 day before each deadline.
class ReminderService {
  static const offsets = [Duration(days: 3), Duration(days: 1)];

  /// Returns reminder times that are still in the future.
  List<DateTime> reminderTimes(Deadline deadline, {DateTime? now}) {
    final current = now ?? DateTime.now();
    return offsets
        .map((o) => deadline.dueDate.toLocal().subtract(o))
        .where((t) => t.isAfter(current))
        .toList();
  }
}
