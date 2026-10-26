# StudyPulse

Mobile app for NURE students that collects deadlines from
dl.nure.ua (Moodle Web Services API), class schedule from CIST
and sends push reminders.

Educational project for the course "IT Project Management" (KhNURE).

## Features (MVP)
- Sign in with your dl.nure.ua account
- All assignment deadlines from all courses in one feed
- Push reminders 3 days and 1 day before a deadline
- Progress per course, offline access

## Tech stack
- Flutter 3 / Dart
- Moodle Web Services REST API
- Firebase Cloud Messaging

## Run
```bash
flutter pub get
flutter run
```

## Workflow
Feature Branch Workflow: `main` contains only stable code,
every task is developed in `feature/<task-name>` and merged via Pull Request
after code review.
