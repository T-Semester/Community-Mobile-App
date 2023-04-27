import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/network/base_client.dart';
import 'dart:io';

import 'package:ts_community_app/features/profile/model/profile_model.dart';

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

  Future<dynamic> updateProfile(String firstName, String lastName, String username, String bio) async {
    try {
      return await baseClient.put(
          url,
          '/auth/profile',
          {
            "first_name": firstName,
            "last_name": lastName,
            "username": username,
            "bio": bio,
          });
    } catch (error) {
      return Future.error(error);
    }
  }


  Future<dynamic> uploadImage(File file) async {
    try {
      return await baseClient.post(
        "https://user-service.talnts.app/api/v1",
        '/upload-file',
        {
          "file": file
        }
      );
    } catch (error) {
      return Future.error(error);
    }
  }




}