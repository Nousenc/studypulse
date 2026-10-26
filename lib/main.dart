import 'package:flutter/material.dart';

void main() => runApp(const StudyPulseApp());

class StudyPulseApp extends StatelessWidget {
  const StudyPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'StudyPulse',
      home: Scaffold(body: Center(child: Text('StudyPulse'))),
    );
  }
}
