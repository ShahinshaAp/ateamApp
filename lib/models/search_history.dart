import 'package:hive/hive.dart';

part 'search_history.g.dart';

@HiveType(typeId: 0)
class SearchHistory extends HiveObject {
  @HiveField(0)
  final String startLocation;

  @HiveField(1)
  final String endLocation;

  @HiveField(2)
  final DateTime timestamp;

  SearchHistory({
    required this.startLocation,
    required this.endLocation,
    required this.timestamp,
  });
}