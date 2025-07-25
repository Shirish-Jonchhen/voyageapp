import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StudyPreferencesPage extends StatefulWidget {
  const StudyPreferencesPage({super.key});

  @override
  State<StudyPreferencesPage> createState() => _StudyPreferencesPageState();
}

class _StudyPreferencesPageState extends State<StudyPreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child:Text("Preferences Page"),);
  }
}
