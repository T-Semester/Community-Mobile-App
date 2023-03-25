import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ts_community_app/common/widgets/constants/constants.dart';
import 'package:ts_community_app/common/widgets/textform_field.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/auth/controller/auth_controller.dart';
import 'package:ts_community_app/features/community/views/create_community.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  final AuthController _authController =
  Get.put(AuthController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Communities',
      //     style: TextStyle(color: primaryColor),
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(() =>  const CreateCommunity());
        },
        backgroundColor: floatingActionButtonColor,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text('Communities',
              style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 24),),
          ],
        ),
      ),
    );
  }
}
