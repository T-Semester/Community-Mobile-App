import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/community/models/communites_model.dart';
import 'package:ts_community_app/features/community/views/create_community.dart';
import 'package:ts_community_app/features/community/controller/communities_controller.dart';
import 'package:flutter/scheduler.dart';
import 'package:ts_community_app/common/helpers/utils.dart';
import 'package:ts_community_app/common/helpers/get_storage.dart';
import 'package:ts_community_app/common/helpers/assets.dart';
import 'package:ts_community_app/common/helpers/custom_svg.dart';


class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  final introdata = GetStorage();



  final CommunitiesController _communitiesController =
  Get.put(CommunitiesController());

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _communitiesController.getAllCommunities();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text('Communities',
              style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 24),),
            const SizedBox(
              height: 30,
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
