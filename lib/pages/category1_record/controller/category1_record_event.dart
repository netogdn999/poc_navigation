
part of 'category1_record_bloc.dart';

abstract class Category1RecordEvent {
  const Category1RecordEvent();
}

class RegisterCategory1 extends Category1RecordEvent {
  final Category1RecordModel category;

  RegisterCategory1({required String name})
    : category = Category1RecordModel(
      name: name,
    );
}