import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ts_community_app/features/community/controller/communities_controller.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/community/models/communites_model.dart';
import 'package:ts_community_app/common/helpers/utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ts_community_app/common/widgets/constants/constants.dart';




class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final CommunitiesController _communitiesController =
  Get.put(CommunitiesController());
  String? selectedPlatform;
  String? selectedStatus;


  @override
  void initState() {
    _communitiesController.getAllCommunities();
    super.initState();
  }

  OutlineInputBorder get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Color.fromRGBO(130, 130, 130, 1),
      width: 0,
    ),
  );

  void searchByAll(String value){
     _communitiesController.listOfCommunities.where(
             (element) =>
     element.status! == value || element.platform! == value || element.communityName! == value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text('Search',
              style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 24),),
            const SizedBox(
              height: 20,
            ),
            searchCommunities(),
            const SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children:<Widget> [
                  Container(
                    width: 170,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      color:  const Color.fromRGBO(130, 130, 130, 1),
                      width: 0.5),),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      hint: const Text(
                        'Platform',
                        style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1)),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1)),
                      buttonHeight: 40,
                      buttonPadding: const EdgeInsets.only(left: 1, right: 10),
                      items: platform
                          .map(
                            (item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                      )
                          .toList(),
                      onSaved: (value) {
                        selectedPlatform = value.toString();
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedPlatform = value.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please select a type";
                        } else {
                          return null;
                        }
                      },
                    ) ,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color:  const Color.fromRGBO(130, 130, 130, 1),
                          width: 0.5),),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      hint: const Text(
                        'Platform',
                        style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1)),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1)),
                      buttonHeight: 50,
                      buttonPadding: const EdgeInsets.only(left: 1, right: 10),
                      items: platform
                          .map(
                            (item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                      )
                          .toList(),
                      onSaved: (value) {
                        selectedPlatform = value.toString();
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedPlatform = value.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please select a type";
                        } else {
                          return null;
                        }
                      },
                    ) ,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color:  const Color.fromRGBO(130, 130, 130, 1),
                          width: 0.5),),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      hint: const Text(
                        'Platform',
                        style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1)),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1)),
                      buttonHeight: 50,
                      buttonPadding: const EdgeInsets.only(left: 1, right: 10),
                      items: platform
                          .map(
                            (item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                      )
                          .toList(),
                      onSaved: (value) {
                        selectedPlatform = value.toString();
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedPlatform = value.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please select a type";
                        } else {
                          return null;
                        }
                      },
                    ) ,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color:  const Color.fromRGBO(130, 130, 130, 1),
                          width: 0.5),),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      hint: const Text(
                        'Status',
                        style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1)),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      style: const TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1)),
                      buttonHeight: 50,
                      buttonPadding: const EdgeInsets.only(left: 1, right: 10),
                      items: communityTypes
                          .map(
                            (item) =>
                            DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                      )
                          .toList(),
                      onSaved: (value) {
                        selectedPlatform = value.toString();
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedPlatform = value.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Please select a type";
                        } else {
                          return null;
                        }
                      },
                    ) ,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Communities',
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx((){
                if(_communitiesController.isLoading.value){
                  return const Center(child: CircularProgressIndicator());
                } else if(_communitiesController.errorMessage.isNotEmpty){
                  return const Center(child: Text('An error occurred'));
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: _communitiesController.listOfCommunities.length,
                    itemBuilder: ((context, index){
                      CommunitiesModel model = _communitiesController.listOfCommunities[index];
                      return communitiesList(model);
                    }),
                  );
                }

              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchCommunities() {
    return Container(
      decoration: BoxDecoration(
        color: searchBar, // container background color
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: (value){
           searchByAll(value);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 23.0),
          prefixIcon: Container(
           child: Icon(Icons.search, color: searchIconColor,),
          ),
          hintText: 'Search Communities',
          hintStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 14, color: searchIconColor),// hint text inside the container
          suffixIcon: Container(
            height: 62,
            decoration: BoxDecoration(
              color: statusBar, // background color for suffix icon
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Icon(Icons.search, color: Colors.white),
          ),
        ),
      ),

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
            style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
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
                communityStatus(model.creator!.fullName),
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
