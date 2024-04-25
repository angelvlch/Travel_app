import 'package:flutter/material.dart';
import 'package:travel_app/core/app/dependencies/di.dart';
import 'package:travel_app/my_app.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}
