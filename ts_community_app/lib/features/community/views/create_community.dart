import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ts_community_app/common/widgets/bottom_navbar.dart';
import 'package:ts_community_app/common/widgets/constants/constants.dart';
import 'package:ts_community_app/common/widgets/textform_field.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/common/widgets/chip_input.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:ts_community_app/features/community/views/communities.dart';

class CreateCommunity extends StatefulWidget {
  const CreateCommunity({Key? key}) : super(key: key);

  @override
  State<CreateCommunity> createState() => _CreateCommunityState();
}

class _CreateCommunityState extends State<CreateCommunity> {
  final GlobalKey<ChipsInputState> _chipKey = GlobalKey();
  String? selectedPlatform;
  String? selectedStatus;
  List<String> inputValues = [];

  final TextEditingController _communityName = TextEditingController();
  final TextEditingController _communityDescription = TextEditingController();
  final TextEditingController _inviteLink = TextEditingController();
  final TextEditingController _instructions = TextEditingController();
  final TextEditingController _categories = TextEditingController();
  final TextEditingController _tags = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Community',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LabelTextFormField(
                    controller: _communityName,
                    hintText: 'Community Name',
                    validator: (value) {
                      if (value != '') {
                        return null;
                      } else {
                        return "Community Name cannot be empty!";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color.fromRGBO(130, 130, 130, 1),
                          width: 0.5),
                    ),
                    child: TextField(
                      controller: _communityDescription,
                      cursorColor: grey,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Community Description',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(130, 130, 130, 1),
                          width: 0.5,
                        ),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Platform',
                      style: TextStyle(color: Color.fromRGBO(130, 130, 130, 1)),
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
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: platform
                        .map(
                          (item) => DropdownMenuItem<String>(
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(130, 130, 130, 1),
                          width: 0.1,
                        ),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Status',
                      style: TextStyle(color: Color.fromRGBO(130, 130, 130, 1)),
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
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: communityTypes
                        .map(
                          (item) => DropdownMenuItem<String>(
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
                      selectedStatus = value.toString();
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value.toString();
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select a type";
                      } else {
                        return null;
                      }
                    },
                  ),
                  if (selectedStatus != null &&
                      selectedStatus == "Open Community")
                    openCommunity(),
                  if (selectedStatus != null &&
                      selectedStatus == "Closed Community")
                    closedCommunity(),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Wrap(
                          children: inputValues.map((value){
                            return InputChip(
                              label: Text(value),
                              onDeleted: (){
                                setState(() {
                                  inputValues.remove(value);
                                });
                              },

                            );
                          }).toList(),
                        ),
                        LabelTextFormField(
                          controller: _tags,
                          hintText: 'Tags',
                          validator: (value) {
                            if (value != '') {
                              return null;
                            } else {
                              return "Tags cannot be empty!";
                            }
                          },
                          onChanged: (value){
                            if (value.endsWith(' ')) {
                              setState(() {
                                inputValues.add(value.trim()); // Add new chip
                              });
                              _tags.clear(); // Clear TextField
                            }

                          },
                        ),

                      ],
                    ),
                  ),
                  Wrap(
                    children: inputValues.map((value){
                      return InputChip(
                          label: Text(value),
                        onDeleted: (){
                            setState(() {
                              inputValues.remove(value);
                            });
                        },

                      );
                    }).toList(),
                  ),
                  LabelTextFormField(
                    controller: _tags,
                    hintText: 'Tags',
                    validator: (value) {
                      if (value != '') {
                        return null;
                      } else {
                        return "Tags cannot be empty!";
                      }
                    },
                    onChanged: (value){
                      if (value.endsWith(' ')) {
                        setState(() {
                          inputValues.add(value.trim()); // Add new chip
                        });
                        _tags.clear(); // Clear TextField
                      }

                    },
                  ),

                ],
              ),
            )),
      ),
    );
  }

  Widget openCommunity() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        LabelTextFormField(
          controller: _inviteLink,
          hintText: 'Invite Link/Instructions',
          labelstyle:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          validator: (value) {
            if (value == null) {
              return 'Invite link is required!';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  Widget closedCommunity() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        LabelTextFormField(
          controller: _instructions,
          hintText:
              'Instructions to join(email or phone number of group admin)',
          labelstyle:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          validator: (value) {
            if (value == null) {
              return 'Field is required!';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
