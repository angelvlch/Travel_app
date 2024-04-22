import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/features/main/data/api/api.dart';
import 'package:travel_app/my_app.dart';

void main() {
  CategoryApiImp(dio: Dio()).getCategories();
  runApp(const MyApp());
}
