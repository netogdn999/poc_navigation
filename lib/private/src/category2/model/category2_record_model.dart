import 'package:finance/private/core/entity/category2.dart';

class Category2RecordModel extends Category2 {
  final String name;

  const Category2RecordModel({required this.name});

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}