import 'package:finance/private/core/entity/institution_group.dart';

class InstitutionGroupFetchModel extends InstitutionGroup {
  final int id;
  final String name;

  const InstitutionGroupFetchModel({required this.id, required this.name});

  factory InstitutionGroupFetchModel.fromJson(Map<String, dynamic> json) {
    return InstitutionGroupFetchModel(
      id: json['id'],
      name: json['name'],
    );
  }
}