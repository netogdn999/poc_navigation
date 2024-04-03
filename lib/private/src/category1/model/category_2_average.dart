class Category2Average {
  final String name;
  final double avegare;

  String percentage({required double total}) {
    return "${((avegare/total)*100).toStringAsFixed(2)}%";
  }

  const Category2Average({required this.name, required this.avegare});

  factory Category2Average.fromJson(Map<String, dynamic> json) =>
    Category2Average(
      name: json['name'], 
      avegare: json['average'],
    );
}