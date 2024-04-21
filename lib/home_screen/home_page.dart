import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/profile/profile.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/components.dart';
import 'package:tadrebk/sign_up_screen/sign_up.dart';
import 'package:url_launcher/url_launcher.dart';


import '../login_screen/login.dart';
import '../profile/cubit.dart';
import '../profile/states.dart';
import '../shared/fonts.dart';
import '../training_categories/training_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 bool isLoggedIn=false;


@override
void initState() {

  isLoggedIn = cachHelper.getData(key: 'type')!=null;
  ProfileCubit.get(context).getUserData();

    // TODO: implement initState
    super.initState();

  }
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


        return Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
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
                              color: Colors.black,
                              spreadRadius: 2,
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
                                      child: InkWell(
                                        onTap: (){
                                          // Navigator.pushAndRemoveUntil(
                                          // context,
                                          // MaterialPageRoute(builder: (context) => TrainingCategories()), (route) => false,
                                          // );
                                        },
                                        child: Text(
                                          'Courses',
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
                            isLoggedIn == false ? Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => Login()),
                                            (route) => false);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.06,
                                    height: MediaQuery.of(context).size.width * 0.03,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: mainColor, // Outline color
                                        width: 1, // Outline width
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: mainColor,
                                            fontFamily: 'Poppins',
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => SignUp()),
                                            (route) => false);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.1,
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
                                        'Sign Up',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ): InkWell(
                              onTap: (){

                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) => const Profile()), (route) => false);


                              },
                              child: Row(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Image.asset('assets/images/img_1.png',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.84,
                            fit: BoxFit.fill),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.76,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40, left: 80),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.24,
                                      height:
                                      MediaQuery.of(context).size.height * 0.4,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              'Develop Your Skills in a new and unique way',
                                              style: TextStyle(
                                                fontSize: 34,
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Our website is an ideal destination for individuals who want to enhance their skills through practical exercises. We offer a wide range of training programs in various fields. Our website is user-friendly and provides a simple interface that allows you to access the content easily and flexibly.',
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height * 0.22,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width *
                                                0.08,
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                            child: Card(
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 8),
                                                      child: Image.asset(
                                                        'assets/images/img_10.png',
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.04,
                                                        height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.1,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '30000+',
                                                    style: TextStyle(
                                                      color: mainColor,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        bottom: 6),
                                                    child: Text(
                                                      'Training',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width *
                                                0.08,
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                            child: Card(
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 8),
                                                      child: Image.asset(
                                                        'assets/images/img_11.png',
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.04,
                                                        height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.1,
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        bottom: 6),
                                                    child: Text(
                                                      'Certificate',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width *
                                                0.08,
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                            child: Card(
                                              color: Colors.white,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 8),
                                                      child: Image.asset(
                                                        'assets/images/img_7.png',
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.04,
                                                        height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.1,
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        bottom: 6),
                                                    child: Text(
                                                      'Add Training',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 12),
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
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.64,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Image.asset(
                                        'assets/images/img_8.png',
                                        width:
                                        MediaQuery.of(context).size.width * 0.32,
                                        height:
                                        MediaQuery.of(context).size.height * 0.44,
                                      ),
                                      Image.asset(
                                        'assets/images/img_8.png',
                                        width:
                                        MediaQuery.of(context).size.width * 0.32,
                                        height:
                                        MediaQuery.of(context).size.height * 0.4,
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'assets/images/img_5.png',
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height * 0.34,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'assets/images/img_13.png',
                                          width: MediaQuery.of(context).size.width *
                                              0.08,
                                        ),
                                        ClipRect(
                                          clipper: TopClipper(),
                                          child: Image.asset(
                                            'assets/images/img_12.png',
                                            width: MediaQuery.of(context).size.width *
                                                0.18,
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.48,
                                            fit: BoxFit.cover,
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
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.66,
                      color: HexColor('#333333'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          introComponents(
                              context,
                              'assets/images/img_18.png',
                              'Training',
                              '"Explore the realm of knowledge and gain new skills through our innovative platform for course delivery. Embark on an exciting learning journey and acquire life-changing'

                          ),
                          introComponents(
                              context,
                              'assets/images/img_19.png',
                              'Certificate',
                              '"We provide certified credentials upon successfully completing courses, enhancing job opportunities and personal professional development'

                          ),
                          introComponents(
                              context,
                              'assets/images/img_20.png',
                              'Find your training',
                              '"The search feature enables users to easily find relevant courses based on their interests and needs'
                          ),
                          introComponents(
                              context,
                              'assets/images/img_21.png',
                              'Add Training',
                              '"The platform enables companies to provide customized training and effectively track participant progress'
                          ),
                          SizedBox(width: 4,),

                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.34,
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

class TopClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 1, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}






Widget introComponents(
    context,
    image,
    text1,
text2
    ){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 20,top: 60,),
      child: Container(
        width: MediaQuery.of(context).size.width*0.23,
        height: MediaQuery.of(context).size.height*0.6,
        child: Column(

          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.14,
              height: MediaQuery.of(context).size.height*0.26,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(image,
                fit: BoxFit.cover,

              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(text1,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: mainFont,
                  color: mainColor
              ),

            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Text(text2,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: mainFont,
                    color:Colors.white,
                  letterSpacing: 1.5
                ),
                textAlign: TextAlign.start,


              ),
            ),
          ],
        ),
      ),
    ),
  );
}




