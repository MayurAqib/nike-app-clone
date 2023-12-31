import 'package:flutter/material.dart';

import '../../utils/my_drawer.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events Page'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
