import 'package:finance/private/core/entity/institution.dart';

class InstitutionRecordModel extends Institution {
  final String name;

  const InstitutionRecordModel({required this.name});

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}