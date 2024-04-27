import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/shared/cach_helper.dart';

import '../login_screen/login.dart';
import '../payment_page/payment.dart';
import '../profile/profile.dart';
import '../shared/colors.dart';
import '../shared/components.dart';
import '../shared/fonts.dart';
import '../shared/header_widget.dart';
import '../sign_up_screen/sign_up.dart';

class TrainingDetails extends StatefulWidget {

  final String description;
  final String companyName;
  final String trainingName;
  final String specialization;
  final String cost;
  final String startDate;
  final String endDate;
  final String city;
  final String street;
  final String category;
  final String image;
  final String id;
  final String isLiked;
  final String isPaid;

  TrainingDetails({
    required this.description,
    required this.companyName,
    required this.trainingName,
    required this.specialization,
    required this.cost,
    required this.startDate,
    required this.endDate,
    required this.city,
    required this.street,
    required this.category,
    required this.image,
    required this.id,
    required this.isPaid,
    required this.isLiked,
  });

  @override
  State<TrainingDetails> createState() => _TrainingDetailsState();
}

class _TrainingDetailsState extends State<TrainingDetails> {

  bool isLoggedIn=false;


  @override
  void initState() {

    isLoggedIn = cachHelper.getData(key: 'type')!=null;
    ProfileCubit.get(context).getUserData();

    // TODO: implement initState
    super.initState();

    print(widget.image);

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStatus>(
      listener: (context ,state){},
      builder: (context,state){


        final model = ProfileCubit.get(context).userModel;
        var firstName = model?.firstName;
        var lastName = model?.lastName;
        var email = model?.email;
        var phoneNumber = model?.phoneNumber;
        var image = model?.image;
        var city = model?.city;
        var street = model?.street;
        var isPerson = model?.isPerson;



        return Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeaderWidget(
                      index: 1,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: secondColor,
                      child: Row(
                        children: [



                          Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                 Container(
                                     width: MediaQuery.of(context).size.width*0.6,
                                     height: MediaQuery.of(context).size.height*0.32,
                                   color: Colors.white,
                                   child: Padding(
                                     padding: const EdgeInsets.all(10.0),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text('About SEO',
                                         style: TextStyle(
                                           fontSize: 24,
                                           fontFamily: mainFont,
                                           fontWeight: FontWeight.bold,
                                         ),
                                         ),
                                         SizedBox(
                                           height: 5,
                                         ),
                                         Expanded(
                                           child: Text('- ${widget.description}',
                                           style: TextStyle(
                                             fontSize: 14,
                                             fontFamily: mainFont,
                                             color: mainColor
                                           ),
                                             maxLines: 5,
                                             overflow: TextOverflow.ellipsis,

                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                SizedBox(
                                  height: 20,
                                ),
                                 Container(
                                     width: MediaQuery.of(context).size.width*0.6,
                                     height: MediaQuery.of(context).size.height*0.4,

                                   child: Card(
                                     color: Colors.white,
                                     child: Padding(
                                       padding: const EdgeInsets.all(10.0),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text('Details',
                                           style: TextStyle(
                                             fontSize: 24,
                                             fontFamily: mainFont,
                                             fontWeight: FontWeight.bold,
                                           ),
                                           ),
                                           SizedBox(
                                             height: 10,
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.only(left: 20,right: 20),
                                             child: Row(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Column(
                                                   children: [
                                                     SizedBox(
                                             width: MediaQuery.of(context).size.width*0.22,
                                                                                    height: MediaQuery.of(context).size.height*0.05,
                                                       child: Row(
                                                         children: [
                                                           Text('Training Name',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,

                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),
                                                           Spacer(),
                                                           Text(widget.trainingName,
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,
                                                                 color: mainColor,
                                                               fontWeight: FontWeight.bold
                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),

                                                         ],
                                                       ),
                                                     ),
                                                     SizedBox(
                                                       width: MediaQuery.of(context).size.width*0.22,
                                                       height: MediaQuery.of(context).size.height*0.05,
                                                       child: Row(
                                                         children: [
                                                           Text('Training Specialization',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,

                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),
                                                           Spacer(),
                                                           Text('${widget.specialization}',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,
                                                                 color: mainColor,
                                                                 fontWeight: FontWeight.bold
                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),

                                                         ],
                                                       ),
                                                     ),
                                                     SizedBox(
                                                       width: MediaQuery.of(context).size.width*0.22,
                                                       height: MediaQuery.of(context).size.height*0.05,
                                                       child: Row(
                                                         children: [
                                                           Text('Training Cost',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,

                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),
                                                           Spacer(),
                                                           Text('${widget.cost}',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,
                                                                 color: mainColor,
                                                                 fontWeight: FontWeight.bold
                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),

                                                         ],
                                                       ),
                                                     ),
                                                     SizedBox(
                                                       width: MediaQuery.of(context).size.width*0.22,
                                                       height: MediaQuery.of(context).size.height*0.05,
                                                       child: Row(
                                                         children: [
                                                           Text('Start Date',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,

                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),
                                                           Spacer(),
                                                           Text('${widget.startDate}',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,
                                                                 color: mainColor,
                                                                 fontWeight: FontWeight.bold
                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),

                                                         ],
                                                       ),
                                                     ),
                                                     SizedBox(
                                                       width: MediaQuery.of(context).size.width*0.22,
                                                       height: MediaQuery.of(context).size.height*0.05,
                                                       child: Row(
                                                         children: [
                                                           Text('End Date',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,

                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),
                                                           Spacer(),
                                                           Text('${widget.endDate}',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,
                                                                 color: mainColor,
                                                                 fontWeight: FontWeight.bold
                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),

                                                         ],
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                                Spacer(),
                                                 Column(
                                                   mainAxisAlignment: MainAxisAlignment.start,
                                                   children: [
                                                     SizedBox(
                                                       width: MediaQuery.of(context).size.width*0.22,
                                                       height: MediaQuery.of(context).size.height*0.05,
                                                       child: Row(
                                                         children: [
                                                           Text('City',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,

                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),
                                                           Spacer(),
                                                           Text('${widget.city}',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,
                                                                 color: mainColor,
                                                                 fontWeight: FontWeight.bold
                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),

                                                         ],
                                                       ),
                                                     ),
                                                     SizedBox(
                                                       width: MediaQuery.of(context).size.width*0.22,
                                                       height: MediaQuery.of(context).size.height*0.05,
                                                       child: Row(
                                                         children: [
                                                           Text('Street',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,

                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),
                                                           Spacer(),
                                                           Text('${widget.street}',
                                                             style: TextStyle(
                                                                 fontSize: 14,
                                                                 fontFamily: mainFont,
                                                                 color: mainColor,
                                                                 fontWeight: FontWeight.bold
                                                             ),
                                                             maxLines: 5,
                                                             overflow: TextOverflow.ellipsis,

                                                           ),

                                                         ],
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.3,
                            height: MediaQuery.of(context).size.height,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.25,
                                    height: MediaQuery.of(context).size.height*0.3,
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.white,
                                      child: widget.image == '' ?
                                      Image.asset('assets/images/img_23.png'):
                                      Image.network('${widget.image}',fit: BoxFit.cover,),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.25,
                                    height: MediaQuery.of(context).size.height*0.6,
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.white,
                                      child:Column(
                                       children: [
                                         Container(
                                           width: double.infinity,

                                           height: MediaQuery.of(context).size.height*0.08,
                                           color: mainColor,
                                           child: Center(
                                             child: Text('Training Details',
                                               style: TextStyle(
                                                 fontSize: 22,
                                                 fontFamily: mainFont,
                                                 fontWeight: FontWeight.bold,
                                                 color:Colors.white
                                               ),
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           height: 20,
                                         ),
                                         SizedBox(
                                           width: MediaQuery.of(context).size.width*0.22,
                                           height: MediaQuery.of(context).size.height*0.05,
                                           child: Row(
                                             children: [
                                               Text('Training Name:',
                                                 style: TextStyle(
                                                   fontSize: 14,
                                                   fontFamily: mainFont,
                                                   color: mainColor

                                                 ),
                                                 maxLines: 5,
                                                 overflow: TextOverflow.ellipsis,

                                               ),
                                               SizedBox(
                                                 width: 10,
                                               ),
                                               Text('${widget.trainingName}',
                                                 style: TextStyle(
                                                     fontSize: 14,
                                                     fontFamily: mainFont,
                                                     fontWeight: FontWeight.bold
                                                 ),
                                                 maxLines: 5,
                                                 overflow: TextOverflow.ellipsis,

                                               ),

                                             ],
                                           ),
                                         ),
                                         Divider(),
                                         SizedBox(
                                           width: MediaQuery.of(context).size.width*0.22,
                                           height: MediaQuery.of(context).size.height*0.05,
                                           child: Row(
                                             children: [
                                               Text('Lessons:',
                                                 style: TextStyle(
                                                     fontSize: 14,
                                                     fontFamily: mainFont,
                                                     color: mainColor

                                                 ),
                                                 maxLines: 1,
                                                 overflow: TextOverflow.ellipsis,

                                               ),
                                               SizedBox(
                                                 width: 10,
                                               ),
                                               Text('15 Lessons',
                                                 style: TextStyle(
                                                     fontSize: 14,
                                                     fontFamily: mainFont,
                                                     fontWeight: FontWeight.bold
                                                 ),
                                                 maxLines: 1,
                                                 overflow: TextOverflow.ellipsis,

                                               ),

                                             ],
                                           ),
                                         ),
                                         Divider(),
                                         SizedBox(
                                           width: MediaQuery.of(context).size.width*0.22,
                                           height: MediaQuery.of(context).size.height*0.05,
                                           child: Row(
                                             children: [
                                               Text('Training Time:',
                                                 style: TextStyle(
                                                     fontSize: 14,
                                                     fontFamily: mainFont,
                                                     color: mainColor

                                                 ),
                                                 maxLines: 1,
                                                 overflow: TextOverflow.ellipsis,

                                               ),
                                               SizedBox(
                                                 width: 10,
                                               ),
                                               Text(' ${widget.startDate} to ${widget.endDate} ',
                                                 style: TextStyle(
                                                     fontSize: 14,
                                                     fontFamily: mainFont,
                                                     fontWeight: FontWeight.bold
                                                 ),
                                                 maxLines: 1,
                                                 overflow: TextOverflow.ellipsis,

                                               ),

                                             ],
                                           ),
                                         ),
                                         Divider(),
                                         SizedBox(
                                           width: MediaQuery.of(context).size.width*0.22,
                                           height: MediaQuery.of(context).size.height*0.05,
                                           child: Row(
                                             children: [
                                               Text('Training Cost:',
                                                 style: TextStyle(
                                                     fontSize: 14,
                                                     fontFamily: mainFont,
                                                     color: mainColor

                                                 ),
                                                 maxLines: 1,
                                                 overflow: TextOverflow.ellipsis,

                                               ),
                                               SizedBox(
                                                 width: 10,
                                               ),
                                               Text('${widget.cost}',
                                                 style: TextStyle(
                                                     fontSize: 14,
                                                     fontFamily: mainFont,
                                                     fontWeight: FontWeight.bold
                                                 ),
                                                 maxLines: 1,
                                                 overflow: TextOverflow.ellipsis,

                                               ),

                                             ],
                                           ),
                                         ),
                                         Divider(),
                                         Text('No prior knowledge required',
                                           style: TextStyle(
                                               fontSize: 14,
                                               fontFamily: mainFont,
                                               fontWeight: FontWeight.bold
                                           ),
                                           maxLines: 5,
                                           overflow: TextOverflow.ellipsis,

                                         ),
                                         Divider(),
                                         Spacer(),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Text(
                                               '(122)',
                                               style: TextStyle(
                                                 fontSize: 16,
                                                 fontFamily: 'Arial',
                                                 fontWeight: FontWeight.bold,
                                               ),
                                             ),

                                             SizedBox(width: 10),



                                             Icon(
                                               Icons.star,
                                               color: mainColor,
                                               size: 20,
                                             ),
                                             SizedBox(width: 5),
                                             Icon(
                                               Icons.star,
                                               color:mainColor,
                                               size: 20,
                                             ),
                                             SizedBox(width: 5),
                                             Icon(
                                               Icons.star,
                                               color: mainColor,
                                               size: 20,
                                             ),
                                             SizedBox(width: 5),
                                             Icon(
                                               Icons.star,
                                               color: mainColor,
                                               size: 20,
                                             ),
                                             SizedBox(width: 5),
                                             Icon(
                                               Icons.star_border,
                                               color: mainColor,
                                               size: 20,
                                             ),


                                           ],
                                         ),
                                         SizedBox(height: 10),
                                         InkWell(
                                           onTap: () {
                                             showDialog(
                                                 context:context ,
                                                 builder: (context){
                                                   return Payment(
                                                       companyName: widget.companyName,
                                                       city: widget.city,
                                                       street: widget.street,
                                                       trainingSpecialization: widget.specialization,
                                                       trainingCost: widget.cost,
                                                       trainingDescription: widget.description,
                                                       startDate: widget.startDate,
                                                       endDate: widget.endDate,
                                                       trainingName: widget.trainingName,
                                                       category: widget.category,
                                                       id: widget.id,
                                                       isLiked:widget.isLiked ,
                                                       isPaid: widget.isPaid,
                                                       image: widget.image
                                                   );

                                                 }
                                             );
                                           },
                                           child: Container(
                                             width: MediaQuery.of(context).size.width * 0.2,
                                             height: MediaQuery.of(context).size.width * 0.03,
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(10),
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
                                                 'Apply For Training',
                                                 style: TextStyle(
                                                     color: Colors.white,
                                                     fontFamily: 'Poppins',
                                                     fontSize: 18),
                                               ),
                                             ),
                                           ),
                                         ),
                                         SizedBox(height: 5),
                                       ],
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

                    footerPage(context),
                  ],
                ),
              )),
        );
      },
    );
  }
}
