import 'dart:io';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ts_community_app/common/helpers/functions.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/common/widgets/round_button.dart';
import 'package:ts_community_app/common/widgets/textform_field.dart';
import 'package:ts_community_app/features/profile/controller/profile_controller.dart';
import 'package:ts_community_app/features/profile/views/profile.dart';

import '../../../common/widgets/bottom_navbar.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
    final _formKey = GlobalKey<FormState>();
    final _profileController = Get.put(ProfileController());
    final TextEditingController _firstNameController = TextEditingController();
    final TextEditingController _lastNameController = TextEditingController();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _bioController = TextEditingController();
    File? image;

    void getDetails() {
      _firstNameController.text = _profileController.profileModel.firstName ?? '';
      _lastNameController.text = _profileController.profileModel.lastName ?? '';
      _usernameController.text = _profileController.profileModel.userName ?? '';
      _bioController.text = _profileController.profileModel.bio?? '';
    }

      @override
  void initState() {
      _profileController.getProfile(onsucess: onsuccess);
      getDetails();
    super.initState();
  }

    void onsuccess() {
      getDetails();
      setState(() {});
    }


    @override
  Widget build(BuildContext context) {
    return Obx(
            () => BlurryModalProgressHUD(
                inAsyncCall: _profileController.isLoading.value,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Edit Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    centerTitle: true,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    foregroundColor: Colors.black,
                    elevation: 0,
                   backgroundColor: Colors.white,
                  ),
                  backgroundColor: Colors.white,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        image == null
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
                                        Positioned(
                                            bottom: 0,
                                            right: -15,
                                            child: IconButton(
                                                onPressed: (){
                                                  selectImage();
                                                },
                                                icon: Icon(Icons.camera_alt, color: statusBar,)
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: image == null
                                  //       ? CachedNetworkImage(
                                  //     imageUrl: _profileController.profileModel.profileImage ==
                                  //         null ||
                                  //         _profileController.profileModel.profileImage ==
                                  //             ''
                                  //         ? "https://pixabay.com/vectors/blank-profile-picture-mystery-man-973460/"
                                  //         : _profileController.profileModel.profileImage!,
                                  //     placeholder: (context, url) =>
                                  //     const CircularProgressIndicator(),
                                  //     errorWidget: (context, url, error) => const Icon(
                                  //       Icons.person,
                                  //       size: 120,
                                  //     ),
                                  //     imageBuilder: (context, imageProvider) => Container(
                                  //       width: 120.0,
                                  //       height: 120.0,
                                  //       decoration: BoxDecoration(
                                  //         shape: BoxShape.circle,
                                  //         image: DecorationImage(
                                  //             image: imageProvider, fit: BoxFit.cover),
                                  //       ),
                                  //     ),
                                  //   )
                                  //       : CircleAvatar(
                                  //     backgroundImage: FileImage(
                                  //       image!,
                                  //     ),
                                  //     radius: 64,
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text('First Name'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  LabelTextFormField(
                                    controller: _firstNameController,
                                    validator: (value) {
                                      if (value != '') {
                                        return null;
                                      } else {
                                        return "Field cannot be empty";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Last Name'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  LabelTextFormField(
                                    controller: _lastNameController,
                                    validator: (value) {
                                      if (value != '') {
                                        return null;
                                      } else {
                                        return "Field cannot be empty";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Username'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  LabelTextFormField(
                                    readOnly: true,
                                    controller: _usernameController,
                                    validator: (value) {
                                      if (value != '') {
                                        return null;
                                      } else {
                                        return "Field cannot be empty";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Bio'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  LabelTextFormField(
                                    controller: _bioController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value != '') {
                                        return null;
                                      } else {
                                        return "Field cannot be empty";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  RoundedButtonWidget(
                                      buttonText: 'Save',
                                      width: double.infinity,
                                      onpressed: (){
                                        _profileController.updateProfile(
                                          _firstNameController.text,
                                          _lastNameController.text,
                                          _usernameController.text,
                                          _bioController.text,
                                        );
                                      }),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ),
            );
  }

    void selectImage() async {
      image = await pickImageFromGallery();
      setState(() {
      });
      print(image);
      print(image!.path);
      _profileController.uploadImage(image!);
    }


}
