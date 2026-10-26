import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/deadline.dart';

/// Feed of all deadlines, grouped by course.
class DeadlineFeedScreen extends StatelessWidget {
  const DeadlineFeedScreen({super.key, required this.deadlines, required this.onRefresh});

  final List<Deadline> deadlines;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final byCourse = <String, List<Deadline>>{};
    for (final d in deadlines) {
      byCourse.putIfAbsent(d.courseName, () => []).add(d);
    }
    final format = DateFormat('dd.MM HH:mm');
    return Scaffold(
      appBar: AppBar(title: const Text('Дедлайни')),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
        children: [
          for (final entry in byCourse.entries) ...[
            ListTile(title: Text(entry.key, style: const TextStyle(fontWeight: FontWeight.bold))),
            for (final d in entry.value)
              ListTile(
                leading: Icon(d.done ? Icons.check_circle : Icons.schedule),
                title: Text(d.title),
                trailing: Text(format.format(d.dueDate)),
              ),
          ],
        ],
        ),
      ),
    );
  }
}
