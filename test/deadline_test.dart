import 'package:flutter_test/flutter_test.dart';
import 'package:studypulse/models/deadline.dart';

void main() {
  test('parses assignments and sorts them by due date', () {
    final json = {
      'courses': [
        {
          'fullname': 'Управління ІТ проєктами',
          'assignments': [
            {'id': 2, 'name': 'ЛР 2', 'duedate': 1767225600},
            {'id': 1, 'name': 'ЛР 1', 'duedate': 1764547200},
          ],
        },
      ],
    };
    final list = Deadline.fromMoodle(json);
    expect(list.map((d) => d.title), ['ЛР 1', 'ЛР 2']);
    expect(list.first.courseName, 'Управління ІТ проєктами');
  });

  test('skips assignments without a due date', () {
    final json = {
      'courses': [
        {
          'fullname': 'Java',
          'assignments': [
            {'id': 3, 'name': 'Реферат', 'duedate': 0},
          ],
        },
      ],
    };
    expect(Deadline.fromMoodle(json), isEmpty);
  });

  emptyCourseListTests();
}

void emptyCourseListTests() {
  test('returns empty list when student has no courses', () {
    expect(Deadline.fromMoodle({'courses': []}), isEmpty);
  });
}
