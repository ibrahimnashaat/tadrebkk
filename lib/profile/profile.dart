import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/my_trainings/paid_trainings.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/shared/fonts.dart';

import '../add_training/post.dart';
import '../favorite_page/favorite_page.dart';
import '../login_screen/login.dart';
import '../my_trainings/my_trainings.dart';
import '../shared/colors.dart';
import '../shared/header_widget.dart';

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


        final userModel = ProfileCubit.get(context).userModel;
        var userFirstName = userModel?.firstName;
        var userLastName = userModel?.lastName;
        var userEmail = userModel?.email;
        var userPhoneNumber = userModel?.phoneNumber;
        var userImage = userModel?.image;
        var userCity = userModel?.city;
        var userStreet = userModel?.street;
        var isUser = userModel?.isPerson;

        final companyModel = ProfileCubit.get(context).companyModel;
        var companyName = companyModel?.name;
        var companySpecialization = companyModel?.specialization;
        var companyEmail = companyModel?.email;
        var companyPhoneNumber = companyModel?.phoneNumber;
        var companyImage = companyModel?.image;
        var companyCity = companyModel?.city;
        var companyStreet = companyModel?.street;
        var isCompany = companyModel?.isPerson;

        final windowWidth = MediaQuery.of(context).size.width;
        final windowHeight = MediaQuery.of(context).size.height;


        return windowWidth >=1100 && windowHeight >=600 ? Scaffold(


          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(
                  index: 4,
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
                        LocaleText(
                          'my_account',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: mainFont),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            isUser == 'true' ? userFirstName??'Loading..' : companyName??'Loading..',
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
                                    '${isUser == 'true' ? userFirstName : companyName}',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaidTrainings()));
                                    },
                                    child: Row(
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
                                        LocaleText(
                                          'training',
                                          style: TextStyle(
                                              fontFamily: 'Poppins', fontSize: 10),
                                        ),
                                      ],
                                    ),
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
                                      LocaleText(
                                        'account_settings',
                                        style: TextStyle(
                                            fontFamily: 'Poppins', fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                 isUser == "true" ?InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite()));
                                   },
                                   child: Row(
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
                                        LocaleText(
                                          'my_favorite',
                                          style: TextStyle(
                                              fontFamily: 'Poppins', fontSize: 10),
                                        ),
                                      ],
                                    ),
                                 ) : Container(),
                                  isUser == "true" ? Divider() : Container(),
                                  InkWell(
                                    onTap: (){

                                      ProfileCubit.get(context).resetUserAndCompanyData();
                                      cachHelper.removeData('uId').then((value) async {
                                        cachHelper.removeData('type');
                                        cachHelper.removeData('isPaid');
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
                                        LocaleText(
                                          'logout',
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
                                    'Welcome, ${isUser == 'true' ? userFirstName: companyName}',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  LocaleText(
                                    'manage',
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
                                                  LocaleText(
                                                    'account_settings',
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
                                      isUser == "true"
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
                                                  LocaleText(
                                                    'certificate',
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
                                              child: InkWell(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Post()));
                                                },
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
                                                    LocaleText(
                                                      'add_training',
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
                                              child: InkWell(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTrainings()));
                                                },
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
                                                    LocaleText(
                                                      'my_training',
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
        ):Container();
      },
    );
  }
}
