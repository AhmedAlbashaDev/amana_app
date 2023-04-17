
import 'package:dio/dio.dart';

/// Network Client

Dio client = Dio(
  BaseOptions(
    baseUrl: 'http://nqraa.net:8000/api/',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  ),
);

/// Screen Size
///
 double screenHeight = 0.0;
 double screenWidth = 0.0;