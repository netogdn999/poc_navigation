import 'dart:async';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/src/category1/model/category1_record_model.dart';
import 'package:finance/private/src/category1/repository/category1_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category1_record_state.dart';
part 'category1_record_event.dart';

class Category1RecordBloc extends Bloc<Category1RecordEvent, Category1RecordState> {
  final Category1CreateRepository repositoryCreateCategory1;

  Category1RecordBloc(this.repositoryCreateCategory1) : super(const Category1RecordState.initial()) {
    on<RegisterCategory1>(_register);
  }

  FutureOr<void> _register(RegisterCategory1 event, Emitter<Category1RecordState> emit) async {
    emit(const Category1RecordState.registering());
    final result = await repositoryCreateCategory1(event.category);
    result.map(
      (result) => emit(const Category1RecordState.registered()),
      (error) => emit(Category1RecordState.error(error)),
    );
  }
}