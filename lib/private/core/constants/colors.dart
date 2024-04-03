import 'package:flutter/material.dart';

enum AppColors {
  seedColor(color: Colors.blue),
  white(color: Colors.white),
  transparent(color: Colors.transparent);

  const AppColors({
    required this.color,
  });

  final Color color;
}