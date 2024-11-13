import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:hive/hive.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../models/search_history.dart';

class ResultsScreen extends StatefulWidget {
  final String startLocation;
  final String endLocation;

  const ResultsScreen({
    Key? key,
    required this.startLocation,
    required this.endLocation,
  }) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  MapboxMapController? mapController;

  void _saveSearch() async {
    final box = Hive.box<SearchHistory>('searchHistory');
    final search = SearchHistory(
      startLocation: widget.startLocation,
      endLocation: widget.endLocation,
      timestamp: DateTime.now(),
    );
    await box.add(search);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Search saved successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Results'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveSearch,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: MapboxMap(
              accessToken: 'pk.eyJ1IjoiYWtoaWxsZXZha3VtYXIiLCJhIjoiY2x4MDcwYzZ4MGl2aTJqcmFxbXZzc3lndiJ9.9sxfvrADlA25b1CHX2VuDA',
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 1,
              ),
              onMapCreated: (controller) {
                mapController = controller;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('From: ${widget.startLocation}'),
                Text('To: ${widget.endLocation}'),
                // Add distance and time information here
              ],
            ),
          ),
        ],
      ),
    );
  }
}