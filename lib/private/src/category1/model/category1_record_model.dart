import 'package:finance/private/core/entity/category1.dart';

class Category1RecordModel extends Category1 {
  final String name;

  const Category1RecordModel({required this.name});

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}