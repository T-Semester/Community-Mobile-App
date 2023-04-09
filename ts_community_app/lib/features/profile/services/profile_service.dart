import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/network/base_client.dart';

class ProfileService {
  final introdata = GetStorage();

  BaseClient baseClient = BaseClient();

  Future<dynamic> getProfile() async {
    try {
      return await baseClient.get(
        url,
        '/auth/profile',
      );
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<dynamic> getUserCommunities() async {
    try {
      return await baseClient.get(
        "https://communities-service.talnts.app/api/v1",
        '/communities/',
      );
    } catch (error) {
      return Future.error(error);
    }
  }



}