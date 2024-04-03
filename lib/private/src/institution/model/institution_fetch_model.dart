import 'package:finance/private/core/entity/institution.dart';

class InstitutionFetchModel extends Institution {
  final int id;
  final String name;

  const InstitutionFetchModel({required this.id, required this.name});

  factory InstitutionFetchModel.fromJson(Map<String, dynamic> json) {
    return InstitutionFetchModel(
      id: json['id'], 
      name: json['name'],
    );
  }
}