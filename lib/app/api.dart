import 'package:dio/dio.dart';

final api = Dio(
  BaseOptions(
    baseUrl: 'https://api.nasa.gov/planetary/',
    contentType: "application/json",
  ),
);
