import 'package:flutter/material.dart';

class ArchievScreen extends StatefulWidget {
  const ArchievScreen({super.key});

  @override
  State<ArchievScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<ArchievScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Archived Tasks Screen'),
    );
  }
}
