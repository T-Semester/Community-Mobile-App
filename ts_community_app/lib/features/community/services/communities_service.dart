import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/network/base_client.dart';

class CommunitiesService {
  final introdata = GetStorage();

  BaseClient baseClient = BaseClient();

  Future<dynamic> getAllCommunities() async {
    try {
      return await baseClient.get(
        "https://communities-service.talnts.app/api/v1",
        '/communities/all/all',
      );
    } catch (error) {
      return Future.error(error);
    }
  }

}