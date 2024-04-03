import 'package:finance/private/core/entity/category1.dart';

class Category1FetchModel extends Category1 {
  final int id;
  final String name;

  const Category1FetchModel({required this.id, required this.name});

  factory Category1FetchModel.fromJson(Map<String, dynamic> json) {
    return Category1FetchModel(
      id: json['id'],
      name: json['name'],
    );
  }
}