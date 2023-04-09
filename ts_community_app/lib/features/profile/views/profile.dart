import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/profile/model/profile_model.dart';
import 'package:ts_community_app/features/profile/controller/profile_controller.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final ProfileController _profileController = Get.put(ProfileController());


  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _profileController.getProfile();
      _refreshIndicatorKey.currentState?.show();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                  Text('Edit Profile',
                  style: TextStyle(fontSize: 15, color: floatingActionButtonColor, fontWeight: FontWeight.bold),)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
               radius: 60,
                child: Container(
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     borderRadius: BorderRadius.circular(50),
                // ),
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("",
              style: TextStyle(fontSize: 16, color: floatingActionButtonColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
              const SizedBox(
                height: 5,
              ),
               Text('',
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
                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,),
              const SizedBox(
                height: 10,
              ),


            ],
          ),
        ),
      ),
    );
  }

  // Widget communityList() {
  //    return ListView.builder(
  //        itemBuilder: itemBuilder);
  // }
}
