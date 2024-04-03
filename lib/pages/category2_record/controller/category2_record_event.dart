
part of 'category2_record_bloc.dart';

abstract class Category2RecordEvent {
  const Category2RecordEvent();
}

class RegisterCategory2 extends Category2RecordEvent {
  final int category1Id;
  final Category2RecordModel category;

  RegisterCategory2({required this.category1Id, required String name})
    : category = Category2RecordModel(
      name: name
    );
}

class FetchCategories1 extends Category2RecordEvent {
  const FetchCategories1();
}