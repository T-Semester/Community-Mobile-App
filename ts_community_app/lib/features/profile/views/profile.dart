import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/community/controller/communities_controller.dart';
import 'package:ts_community_app/features/community/views/create_community.dart';
import 'package:ts_community_app/features/profile/model/profile_model.dart';
import 'package:ts_community_app/features/profile/controller/profile_controller.dart';
import 'package:ts_community_app/features/profile/views/edit_profile.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ts_community_app/common/helpers/dialog_box.dart';
import 'package:ts_community_app/common/helpers/utils.dart';
import 'package:ts_community_app/common/helpers/custom_svg.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import '../../community/models/communites_model.dart';




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final ProfileController _profileController = Get.put(ProfileController());
  File? image;



  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _profileController.getProfile(onsucess: onsuccess);
      _profileController.getUserCommunities();
      _refreshIndicatorKey.currentState?.show();
    });
    super.initState();
  }

  void onsuccess() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
            () => BlurryModalProgressHUD(
                inAsyncCall: _profileController.isLoading.value,
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Profile',
                              style: TextStyle(fontSize: 24, color: primaryColor, fontWeight: FontWeight.bold),),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const EditProfile());
                              },
                              child: Text('Edit Profile',
                                style: TextStyle(fontSize: 15, color: floatingActionButtonColor, fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: image == null
                              ? CachedNetworkImage(
                            imageUrl: _profileController.profileModel.profileImage ==
                                null ||
                                _profileController.profileModel.profileImage ==
                                    ''
                                ? "https://pixabay.com/vectors/blank-profile-picture-mystery-man-973460/"
                                : _profileController.profileModel.profileImage!,
                            placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.person,
                              size: 120,
                            ),
                            imageBuilder: (context, imageProvider) => Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                          )
                              : CircleAvatar(
                            backgroundImage: FileImage(
                              image!,
                            ),
                            radius: 64,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(_profileController.profileModel.fullName,
                          style: TextStyle(fontSize: 20, color: floatingActionButtonColor, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(_profileController.profileModel.userName!,
                          style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(_profileController.profileModel.bio!,
                          style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text('Communities',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Flexible(
                          child: Obx((){
                            if(_profileController.isLoading.value){
                              return const Center(child: CircularProgressIndicator());
                            } else if(_profileController.errorMessage.isNotEmpty){
                              return const Center(child: Text('An error occurred'));
                            } else if (_profileController.listOfCommunities.isEmpty) {
                              return  Center(
                                child: emptyCommunityList(),
                                // child: Text(
                                //   'No Communities found',
                                //   style: TextStyle(color: Colors.black),
                                // ),
                              );
                            } else {
                              return ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                                itemCount: _profileController.listOfCommunities.length,
                                itemBuilder: ((context, index){
                                  CommunitiesModel model = _profileController.listOfCommunities[index];
                                  return communitiesList(model);
                                }),
                              );
                            }

                          }),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: (){
                            logoutDialog(context);
                          },
                          child: Text('Logout',
                            style: TextStyle(fontSize: 20, color: red, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
            ),
    );
  }

Widget emptyCommunityList () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSvg(
            assetName: 'assets/images/none.svg'),
        const SizedBox(
          height: 5,
        ),
        const Text('You have no community',
        style: TextStyle(color: Colors.black, fontSize: 15),),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: (){
            Get.to(const CreateCommunity());
          },
          child: Text('Create a Community now!',
            style: TextStyle(color: floatingActionButtonColor, fontSize: 15, fontWeight: FontWeight.w600),),
        ),
      ],
    );
}


  Widget communitiesList(CommunitiesModel model){
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.communityName!,
            style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Text(model.creator!.fullName),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                communityType(model.platform!),
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                communityPlatform(model.platform!),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                communityStatus(model.status!),
              ),
              const SizedBox(
                width: 5,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
