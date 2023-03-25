import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  final introdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
