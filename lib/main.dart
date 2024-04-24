import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/features/main/data/data_source/api.dart';
import 'package:travel_app/my_app.dart';

void main() {
  TourCategoryApiImp(dio: Dio()).getTourCategories(1);
  runApp(const MyApp());
}
