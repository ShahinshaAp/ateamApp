import 'package:ateam_app/screen/history_screen.dart';
import 'package:ateam_app/screen/results_screen.dart';
import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  // MapboxMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Finder'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _startController,
                  decoration: const InputDecoration(
                    labelText: 'Start Location',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _endController,
                  decoration: const InputDecoration(
                    labelText: 'End Location',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_startController.text.isNotEmpty && 
                        _endController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsScreen(
                            startLocation: _startController.text,
                            endLocation: _endController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Navigate'),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: MapboxMap(
          //     accessToken: 'pk.eyJ1IjoiYWtoaWxsZXZha3VtYXIiLCJhIjoiY2x4MDcwYzZ4MGl2aTJqcmFxbXZzc3lndiJ9.9sxfvrADlA25b1CHX2VuDA',
          //     initialCameraPosition: const CameraPosition(
          //       target: LatLng(0, 0),
          //       zoom: 1,
          //     ),
          //     onMapCreated: (controller) {
          //       mapController = controller;
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}