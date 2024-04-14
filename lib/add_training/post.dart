import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/add_training/cubit.dart';
import 'package:tadrebk/add_training/states.dart';
import 'package:tadrebk/shared/fonts.dart';

import '../shared/colors.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var formKey = GlobalKey<FormState>();
  var companyNameController = TextEditingController();
  var cityController = TextEditingController();
  var streetController = TextEditingController();
  var trainingSpecializationController = TextEditingController();
  var trainingCostController = TextEditingController();
  var trainingDescriptionController = TextEditingController();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  String? category;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostStatus>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Image.asset('assets/images/img.png'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Home',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: mainColor,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Courses',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: mainColor,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Contact Us',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: mainColor,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'About Us',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: mainColor,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //
                    if (state is CreatePostLoadingStates)
                      LinearProgressIndicator(),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.86,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60, top: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Row(
                                children: [
                                  Text(
                                    'Add',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: mainFont,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Training',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: mainFont,
                                        color: mainColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Card(
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 20),
                                        child: Text(
                                          'Upload a photo of your Training',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: mainFont,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: InkWell(
                                          onTap: () {
                                            PostCubit.get(context).getPostImage();
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey.withOpacity(0.1),
                                              border: Border.all(
                                                color: mainColor,
                                                width: 2,
                                              ),
                                            ),
                                            child: PostCubit.get(context)
                                                        .postImage !=
                                                    null
                                                ? Stack(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .topEnd,
                                                    children: [
                                                      Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                          child: Image.memory(
                                                            PostCubit.get(context)
                                                                .postImage!,
                                                            fit: BoxFit.cover,
                                                          )),
                                                      IconButton(
                                                          onPressed: () {
                                                            PostCubit.get(context)
                                                                .removePostImage();
                                                          },
                                                          icon: CircleAvatar(
                                                            backgroundColor:
                                                                mainColor,
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Colors.white,
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                : Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.image,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        'Select file',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: mainFont,
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            controller: companyNameController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Enter your Company Name',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.3,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            controller: cityController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'City',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.3,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            controller: streetController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Street',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.3,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            controller:
                                                trainingSpecializationController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText:
                                                  'Enter Training Specialization',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.3,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            controller: trainingCostController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Enter Training Cost',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, top: 10),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.3,
                                          height:
                                              MediaQuery.of(context).size.width *
                                                  0.18,
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            controller:
                                                trainingDescriptionController,
                                            maxLines: 20,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'this field is empty';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'Training Description',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              focusColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 40, right: 40),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.3,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.06,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.14,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.06,
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller: startDateController,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'this field is empty';
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    hintText: 'Start Date',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                    focusColor: Colors.white,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.14,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.06,
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller: endDateController,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'this field is empty';
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    hintText: 'End Date',
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                    focusColor: Colors.white,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {

                                            if (PostCubit.get(context)
                                                    .postImage ==
                                                null) {
                                              PostCubit.get(context).createPost(
                                                companyName: companyNameController.text,
                                                city: cityController.text,
                                                street: streetController.text,
                                                trainingSpecialization:
                                                    trainingSpecializationController
                                                        .text,
                                                trainingCost:
                                                    trainingCostController.text,
                                                trainingDescription:
                                                    trainingDescriptionController
                                                        .text,
                                                startDate:
                                                    startDateController.text,
                                                endDate: endDateController.text,
                                              );
                                            } else {
                                              PostCubit.get(context).uploadPost(
                                                companyName: companyNameController.text,
                                                city: cityController.text,
                                                street: streetController.text,
                                                trainingSpecialization:
                                                    trainingSpecializationController
                                                        .text,
                                                trainingCost:
                                                    trainingCostController.text,
                                                trainingDescription:
                                                    trainingDescriptionController
                                                        .text,
                                                startDate:
                                                    startDateController.text,
                                                endDate: endDateController.text,
                                                context: context,
                                              );



                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 40,
                                            right: 40,
                                            top: 20,
                                            bottom: 30
                                          ),
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.3,
                                            height:
                                                MediaQuery.of(context).size.width *
                                                    0.03,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  HexColor('#1B3358'),
                                                  mainColor
                                                ],
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Submit',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}

