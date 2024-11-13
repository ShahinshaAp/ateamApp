import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/search_history.dart';
import 'results_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search History'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<SearchHistory>('searchHistory').listenable(),
        builder: (context, Box<SearchHistory> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text('No search history available'),
            );
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final search = box.getAt(index);
              return ListTile(
                title: Text('${search?.startLocation} → ${search?.endLocation}'),
                subtitle: Text(
                  search?.timestamp.toString() ?? '',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                        startLocation: search?.startLocation ?? '',
                        endLocation: search?.endLocation ?? '',
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}