import '../models/deadline.dart';

/// Plans local reminders 3 days and 1 day before each deadline.
///
/// Reminders are scheduled as exact alarms so they still fire
/// when Android is in Doze (battery saving) mode.
class ReminderService {
  static const offsets = [Duration(days: 3), Duration(days: 1)];
  static const useExactAlarms = true;

  /// Reminders are not sent at night (23:00–08:00).
  static const quietHoursStart = 23;
  static const quietHoursEnd = 8;

  /// Returns reminder times that are still in the future.
  List<DateTime> reminderTimes(Deadline deadline, {DateTime? now}) {
    final current = now ?? DateTime.now();
    return offsets
        .map((o) => deadline.dueDate.toLocal().subtract(o))
        .where((t) => t.isAfter(current))
        .toList();
  }
}
