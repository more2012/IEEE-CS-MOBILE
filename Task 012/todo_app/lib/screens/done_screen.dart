import 'package:flutter/material.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Done Tasks Screen'),
    );
  }
}
