import 'package:finance/private/core/entity/institution_group.dart';

class InstitutionGroupRecordModel extends InstitutionGroup {
  final String name;

  const InstitutionGroupRecordModel({required this.name});

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}