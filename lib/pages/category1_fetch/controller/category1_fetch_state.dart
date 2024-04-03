
part of 'category1_fetch_bloc.dart';

enum Status {
  inital,
  loading,
  error,
  loadedData,
}

class Category1FetchState {
  final List<Category1FetchWithAverageModel> categories;
  final Failure? error;
  final Status status;

  const Category1FetchState.initial()
    : status = Status.inital,
      error = null,
      categories = const [];

  const Category1FetchState.loading()
    : status = Status.loading,
      error = null,
      categories = const [];

  const Category1FetchState.error(this.error)
    : status = Status.error,
      categories = const [];

  const Category1FetchState.loadedData(this.categories)
    : status = Status.loadedData,
      error = null;
}