import 'package:finance/private/core/entity/category1.dart';
import 'package:finance/private/src/category1/model/category_2_average.dart';

class Category1FetchWithAverageModel extends Category1 {
  final String name;
  final List<Category2Average> categories2Averages;
  double get total => categories2Averages.fold(0.0, (previousValue, element) => previousValue + element.avegare);

  const Category1FetchWithAverageModel({required this.name, required this.categories2Averages});

  factory Category1FetchWithAverageModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> averagesJson = json['category2'];
    return Category1FetchWithAverageModel(
      name: json['name'],
      categories2Averages: averagesJson.map(
        (average) => Category2Average.fromJson(average),
      ).toList(),
    );
  }

}