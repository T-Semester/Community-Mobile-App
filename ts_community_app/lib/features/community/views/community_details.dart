import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/scheduler.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/community/controller/communities_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/features/community/models/communites_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ts_community_app/common/helpers/utils.dart';
import 'package:ts_community_app/features/community/models/communities_details_model.dart';



class CommunityDetails extends StatefulWidget {
  const CommunityDetails({Key? key, required this.commModel}) : super(key: key);

  final CommunitiesDetailsModel commModel;
  //final CommunitiesModel commModel;

  @override
  State<CommunityDetails> createState() => _CommunityDetailsState();
}

class _CommunityDetailsState extends State<CommunityDetails> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  final introdata = GetStorage();

  final CommunitiesController _communitiesController =
  Get.put(CommunitiesController());

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //_communitiesController.getAllCommunitiesById(CommunitiesDetailsModel());
      //_refreshIndicatorKey.currentState?.show();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(widget.commModel.data!.communityName!,
                        style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                      },
                      icon: Icon(Icons.more_vert),
                  color: grey,),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(imageUrl:widget.commModel.data!.creator!.imageUrl! ,
                        height: 22,
                        width: 22,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${widget.commModel.data?.creator!.fullName}',
                    style: const TextStyle(color: Colors.black, fontSize: 16),),
                  ],
                ),
              ),
              Divider(),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: containerBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Description',
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.commModel.data!.communityDescription!)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: containerBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Platform',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          communityType(widget.commModel.data!.platform!),
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          communityPlatform(widget.commModel.data!.platform!),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: containerBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     const Text('Community Status',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      communityStatus(widget.commModel.data!.status!)
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: containerBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Invite Link/Instructions',
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Text(
                          widget.commModel.data!.inviteLink!,
                        style: TextStyle(color: floatingActionButtonColor,),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}