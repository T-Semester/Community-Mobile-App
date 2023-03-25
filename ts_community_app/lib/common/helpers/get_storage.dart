import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final introdata = GetStorage();

  void init() {
    introdata.writeIfNull("display", false);
    introdata.writeIfNull("loggedinbefore", false);
  }
}