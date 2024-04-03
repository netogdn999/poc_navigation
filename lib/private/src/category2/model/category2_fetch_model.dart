import 'package:finance/private/core/entity/category2.dart';

class Category2FetchModel extends Category2 {
  final int id;
  final String name;

  const Category2FetchModel({required this.id, required this.name});

  factory Category2FetchModel.fromJson(Map<String, dynamic> json) {
    return Category2FetchModel(
      id: json['id'],
      name: json['name'],
    );
  }
}