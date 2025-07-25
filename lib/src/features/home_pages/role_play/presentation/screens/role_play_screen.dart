import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RolePlayPage extends StatefulWidget {
  const RolePlayPage({super.key});

  @override
  State<RolePlayPage> createState() => _RolePlayPageState();
}

class _RolePlayPageState extends State<RolePlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Role Play Page")));
  }
}
