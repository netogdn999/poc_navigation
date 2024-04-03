
import 'dart:async';

import 'package:finance/private/core/entity/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../private/src/category1/model/category1_fetch_with_average_model.dart';
import '../../../private/src/category1/repository/category1_repository_interface.dart';

part 'category1_fetch_event.dart';
part 'category1_fetch_state.dart';

class Category1FetchBloc extends Bloc<Category1FetchEvent, Category1FetchState> {
  final Category1FetchAllWithAverageRepository repositoryFetchAllCategory1WithAverage;

  Category1FetchBloc({required this.repositoryFetchAllCategory1WithAverage}) : super(const Category1FetchState.initial()) {
    on<FetchCategories>(_fetchData);
  }

  FutureOr<void> _fetchData(FetchCategories event, Emitter<Category1FetchState> emit) async {
    emit(const Category1FetchState.loading());
    final result = await repositoryFetchAllCategory1WithAverage();
    result.map(
      (result) => emit(Category1FetchState.loadedData(result)),
      (error) => emit(Category1FetchState.error(error)),
    );
  }
  
}