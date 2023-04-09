import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/network/app_exception.dart';
import 'package:ts_community_app/common/network/base_controller.dart';
import 'package:ts_community_app/features/profile/model/profile_model.dart';
import 'package:ts_community_app/features/profile/services/profile_service.dart';

class ProfileController extends GetxController with BaseController {
  final ProfileService _profileService = ProfileService();
  final introdata = GetStorage();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  ProfileModel _profileModel = ProfileModel();
  ProfileModel get profileModel => _profileModel;

  getProfile() {
    _profileService.getProfile().then((value) {
      if(value['status'] == true) {
        isLoading(false);
        _profileModel = ProfileModel.fromMap(value['data']);
        print(_profileModel);
        print(_profileModel.bio);
        isLoading(false);
      }
      }).catchError((e) {
      handleError(e);
      isLoading(false);
    });
  }




}