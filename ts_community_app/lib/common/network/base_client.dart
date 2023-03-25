import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

const String _baseUrl = "https://user-service.talnts.app/api/v1";
String get url => _baseUrl;

class BaseClient {
  static const int TIME_OUT_DURATION = 180;
  final introdata = GetStorage();

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };


}

