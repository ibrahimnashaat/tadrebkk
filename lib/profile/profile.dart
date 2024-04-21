import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/fonts.dart';

import '../login_screen/login.dart';
import '../shared/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStatus>(
      listener: (context,state){},
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


        return  Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()), (route) => false,
                              );
                            },
                            child: Image.asset('assets/images/img.png')),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap:(){
                          Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()), (route) => false,
                          );
                          },
                                    child: Text(
                                      'Home',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: mainColor,
                                        fontFamily: "Poppins",
                                      ),
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
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.black12,
                                backgroundImage:image == null ?
                                AssetImage('assets/images/img_23.png') as ImageProvider :
                                NetworkImage('$image')
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              firstName??'Loading..',
                              style: TextStyle(
                                  fontSize: 16 ,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: mainFont),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(Icons.arrow_drop_down_sharp),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.12,
                  color: mainColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 200, right: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Account',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: mainFont),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            firstName ??'Loading..',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: mainFont),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  color: secondColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.16,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Card(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Image.asset(
                                      'assets/images/img_32.png',
                                      width:
                                      MediaQuery.of(context).size.width * 0.03,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    '$firstName',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  Spacer(),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Image.asset(
                                          'assets/images/img_31.png',
                                          width: MediaQuery.of(context).size.width *
                                              0.012,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'My Training',
                                        style: TextStyle(
                                            fontFamily: 'Poppins', fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Image.asset(
                                          'assets/images/img_30.png',
                                          width: MediaQuery.of(context).size.width *
                                              0.012,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Account settings',
                                        style: TextStyle(
                                            fontFamily: 'Poppins', fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                 isPerson == "true" ?Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Icon(
                                          Icons.favorite_outline_rounded,
                                          color: mainColor,
                                          size: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'My Favorite',
                                        style: TextStyle(
                                            fontFamily: 'Poppins', fontSize: 10),
                                      ),
                                    ],
                                  ) : Container(),
                                  isPerson == "true" ? Divider() : Container(),
                                  InkWell(
                                    onTap: (){
                                      cachHelper.removeData('uId').then((value) async {
                                        cachHelper.removeData('type');
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (context) => Login()), (route) => false,
                                        );
                                      });
                                    },
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Icon(
                                            Icons.logout,
                                            color: mainColor,
                                            size: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          'Logout',
                                          style: TextStyle(
                                              fontFamily: 'Poppins', fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.54,
                          height: MediaQuery.of(context).size.height * 0.42,
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome, $firstName',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Here you can manage your account and view details of the courses you have registered for, as well as the certificates you have obtained',
                                    style: TextStyle(
                                        fontFamily: 'Poppins', fontSize: 10),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                            child: Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(0.0),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 8),
                                                    child: Image.asset(
                                                      'assets/images/img_30.png',
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.03,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    'Account settings',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      isPerson == "true"
                                          ? Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.15,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.2,
                                            child: Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    0.0),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 8),
                                                    child: Image.asset(
                                                      'assets/images/img_11.png',
                                                      width: MediaQuery.of(
                                                          context)
                                                          .size
                                                          .width *
                                                          0.03,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    'Certificate',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                          : Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.15,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.2,
                                            child: Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    0.0),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 8),
                                                    child: Image.asset(
                                                      'assets/images/img_33.png',
                                                      width: MediaQuery.of(
                                                          context)
                                                          .size
                                                          .width *
                                                          0.03,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    'Add Training',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                            child: Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(0.0),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 8),
                                                    child: Image.asset(
                                                      'assets/images/img_31.png',
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.03,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    'My training',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                footerPage(context),
              ],
            ),
          ),
        );
      },
    );
  }
}
