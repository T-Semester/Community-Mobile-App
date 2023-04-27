import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/network/app_exception.dart';
import 'package:ts_community_app/common/network/base_controller.dart';
import 'package:ts_community_app/features/community/models/communites_model.dart';
import 'package:ts_community_app/features/community/services/communities_service.dart';
import 'package:ts_community_app/features/community/models/communities_details_model.dart';

class CommunitiesController extends GetxController with BaseController {
  final CommunitiesService _communitiesService = CommunitiesService();
  final introdata = GetStorage();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  List<CommunitiesModel> listOfCommunities = [];
  List<CommunitiesDetailsModel> listCommunityDetails = [];


  getAllCommunities() {
    _communitiesService.getAllCommunities().then((value) {
      if(value['status'] == true) {
        isLoading(false);
        final communityList = List<CommunitiesModel>.from(
            (value['data']).map((x) => CommunitiesModel.fromMap(x)));
            listOfCommunities = communityList;

      } else {
        isLoading(false);
        throw FetchDataException(value['message'], '');
      }
    }).catchError((e) {
      handleError(e);
      isLoading(false);
    });
  }



  getAllCommunitiesById(CommunitiesDetailsModel model) {
    _communitiesService.getAllCommunitiesById(communityId: model.data!.id.toString()).then((value) {
      if(value['status'] == true) {
        isLoading(false);
        final communityList = List<CommunitiesDetailsModel>.from(
            (value['data']).map((x) => CommunitiesModel.fromMap(x)));
        listCommunityDetails = communityList;

      } else {
        isLoading(false);
        throw FetchDataException(value['message'], '');
      }
    }).catchError((e) {
      handleError(e);
      isLoading(false);
    });
  }




}