import 'package:flutter/material.dart';
import 'theme.dart';

void main() => runApp(const StudyPulseApp());

class StudyPulseApp extends StatelessWidget {
  const StudyPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyPulse',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: const Scaffold(body: Center(child: Text('StudyPulse'))),
    );
  }
}
