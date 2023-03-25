import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ts_community_app/common/widgets/functions.dart';
import 'package:ts_community_app/common/widgets/textform_field.dart';
import 'dart:io';


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
    final _formKey = GlobalKey<FormState>();

   File? image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
             Expanded(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const SizedBox(
                        height: 10,
                       ),
                       image == null ? GestureDetector(
                        onTap: (){},
                       ) : GestureDetector(
                        onTap: (){},
                       ),
                       const SizedBox(
                        height: 10,
                       ),
                       fieldLabel('First Name', false),
                      ],
                    ),
                    ),
                ],
                ),
                ),
          ],
          ),
          ),

    );
  }


}
