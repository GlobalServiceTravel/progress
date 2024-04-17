import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "ghfmun.org",
    headers: {
      "authorization": "Bearer 9866570482",
    },
  ),
);
