import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ts_community_app/features/community/views/communities.dart';
import 'package:ts_community_app/features/profile/views/profile.dart';
import 'package:ts_community_app/features/search/views/search.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/common/helpers/custom_svg.dart';
import 'package:ts_community_app/features/profile/model/profile_model.dart';
import 'package:ts_community_app/features/profile/controller/profile_controller.dart';
import 'package:ts_community_app/features/auth/controller/auth_controller.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int pageIndex = 0;
  final AuthController _authControllerController = Get.put(AuthController());


  List<Widget> pages = const [
    Community(),
    Search(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        currentIndex: pageIndex,
        onTap: (val) {
          setState(() {
            pageIndex = val;
          });
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: grey,
        backgroundColor: Colors.white,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            label: 'Communities',
            icon: Container(
              width: 42,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 3,
                    color: pageIndex == 0 ?primaryColor : Colors.grey,
                  ),
                ),
              ),
              child: CustomSvg(
                assetName: 'assets/images/community.svg',
                height: 20,
                width: 20,
                color: pageIndex == 0 ? primaryColor : Colors.grey,)
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Container(
              width: 42,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 3,
                    color: pageIndex == 1 ? primaryColor : Colors.grey,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: CustomSvg(
                  assetName: 'assets/images/search.svg',
                  height: 20,
                  width: 20,
                  color: pageIndex == 1 ? primaryColor : Colors.grey,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Container(
              width: 42,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 3,
                    color: pageIndex == 2 ? primaryColor : Colors.grey,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: CustomSvg(
                  assetName: 'assets/images/person.svg',
                  height: 20,
                  width: 20,
                  color: pageIndex == 2 ? primaryColor : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
