import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/network/app_exception.dart';
import 'package:ts_community_app/common/network/base_controller.dart';
import 'package:ts_community_app/common/widgets/bottom_navbar.dart';
import 'package:ts_community_app/features/profile/model/profile_model.dart';
import 'package:ts_community_app/features/profile/services/profile_service.dart';
import 'package:ts_community_app/features/community/models/communites_model.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:async/async.dart';
import 'dart:io';
import 'package:ts_community_app/common/network/base_client.dart';
import 'dart:convert';
import 'package:ts_community_app/features/profile/views/profile.dart';

class ProfileController extends GetxController with BaseController {
  final ProfileService _profileService = ProfileService();
  final introdata = GetStorage();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var image = ImageModel().obs;


  List<CommunitiesModel> listOfCommunities = [];

  ProfileModel _profileModel = ProfileModel();
  ProfileModel get profileModel => _profileModel;

  getProfile({required Function onsucess}) {
    _profileService.getProfile().then((value) {
      if(value['status'] == true) {
        isLoading(false);
        _profileModel = ProfileModel.fromMap(value['data']);
        print(_profileModel);
        print(_profileModel.bio);
        onsucess();
        isLoading(false);
        update(['CommunityList']);
      }
      }).catchError((e) {
      handleError(e);
      isLoading(false);
    });
  }


  getUserCommunities() {
    _profileService.getUserCommunities().then((value) {
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



  void updateProfile(String firstName, String lastName, String username, String bio) {
    isLoading(true);
    _profileService.updateProfile(firstName, lastName, username, bio).then((data) {
      isLoading(false);
      if (data['status']) {
         Get.to(()=> const BottomBar());
      }
    }).catchError((e) {
      isLoading(false);
      print(e);
      handleError(e);
    });
  }

  // Future<void> uploadImage1() async {
  //   // create a multipart request
  //   var request = http.MultipartRequest('POST', Uri.parse('https://example.com/upload'));
  //   request.files.add(await http.MultipartFile.fromPath('image', image.value.file!.path));
  //   request.fields['title'] = image.value.title!;
  //
  //   // send the request
  //   var response = await request.send();
  //   // handle the response
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     // update the view with the response data
  //   } else {
  //     // handle the error
  //   }
  // }



void uploadImage(File image) async {
    isLoading(true);
    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    // get file length
    var length = await image.length();
    // string to uri
    var uri = Uri.parse("$url/upload-file");
    print(uri.toString());

    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    var token = introdata.read('access');
    request.headers['Bearer $token'];
    print(request.headers);

    print('hello');

    // multipart that takes file.. here this "image_file" is a key of the API request
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: path.basename(image.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send request to upload image
    await request.send().then((response) async {
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
        isLoading(false);
      });

    }).catchError((e) {
      handleError(e);
      print(e);
      isLoading(false);
    });
  }

  void uploadProfilePic(File image) {
    isLoading(false);
    _profileService.uploadImage(image).then((value) {
      if (value['status'] == true) {}

      }).catchError((e) {
  isLoading(false);
  print(e);
  handleError(e);
  });

  }






}