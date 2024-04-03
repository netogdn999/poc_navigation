import 'dart:async';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/src/category1/model/category1_fetch_model.dart';
import 'package:finance/private/src/category1/repository/category1_repository_interface.dart';
import 'package:finance/private/src/category2/model/category2_record_model.dart';
import 'package:finance/private/src/category2/repository/category2_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category2_record_state.dart';
part 'category2_record_event.dart';

class Category2RecordBloc extends Bloc<Category2RecordEvent, Category2RecordState> {
  final Category2RegisterInCategory1Repository repositoryRegisterCategory2;
  final Category1FetchAllRepository repositoryFetchAllCategory1;

  Category2RecordBloc({required this.repositoryRegisterCategory2, required this.repositoryFetchAllCategory1}) : super(const Category2RecordState.initial()) {
    on<RegisterCategory2>(_register);
    on<FetchCategories1>(_fetchCategories1);
  }

  FutureOr<void> _register(RegisterCategory2 event, Emitter<Category2RecordState> emit) async {
    emit(Category2RecordState.registering(state.categories1));
    final result = await repositoryRegisterCategory2(event.category1Id, event.category);
    result.map(
      (result) => emit(Category2RecordState.registered(state.categories1)),
      (error) => emit(Category2RecordState.error(error)),
    );
  }

  FutureOr<void> _fetchCategories1 (FetchCategories1 event, Emitter<Category2RecordState> emit) async {
    emit(const Category2RecordState.loading());
    final result = await repositoryFetchAllCategory1();
    result.map(
      (result) => emit(Category2RecordState.loaded(result)),
      (error) => emit(Category2RecordState.error(error)),
    );
  }
}