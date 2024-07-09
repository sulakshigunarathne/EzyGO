import 'package:flutter/material.dart';

class RideHistory extends StatefulWidget {
  const RideHistory({super.key});

  @override
  State<RideHistory> createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      appBar: AppBar(
        title: const Text("Ride History"),
      ),
      body: const Center(child: Text("Ride History")),
    );
  }
}