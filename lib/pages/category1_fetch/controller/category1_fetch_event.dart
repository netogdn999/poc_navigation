
part of 'category1_fetch_bloc.dart';

abstract class Category1FetchEvent {
  const Category1FetchEvent();
}

class FetchCategories extends Category1FetchEvent{
  const FetchCategories();
}