


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/my_trainings/paid_trainings.dart';
import 'package:tadrebk/profile/cubit.dart';
import 'package:tadrebk/profile/profile.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/constant.dart';
import 'package:tadrebk/sign_up_screen/cubit.dart';
import 'package:tadrebk/sign_up_screen/sign_up.dart';
import 'package:tadrebk/training_categories/training_categories.dart';
import 'package:tadrebk/training_details/training_details.dart';

import 'add_training/cubit.dart';
import 'add_training/post.dart';

import 'favorite_page/favorite_page.dart';
import 'forget_password/forget_password.dart';
import 'get_trainings/get _trainings_page.dart';
import 'get_trainings/get_all_trainings.dart';
import 'login_screen/cubit.dart';
import 'login_screen/login.dart';
import 'my_trainings/my_trainings.dart';

Future<void> main() async {

  await cachHelper.init();
   FluttertoastWebPlugin();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAei9eaLh9ak_gX4YJEXVgp3W1jiiaiB1M",
        authDomain: "tadrebk-febbd.firebaseapp.com",
        projectId: "tadrebk-febbd",
        storageBucket: "tadrebk-febbd.appspot.com",
        messagingSenderId: "153210364650",
        appId: "1:153210364650:web:1f4fe1cef2c341a0572d93"
    ),
  );






  Widget widget ;
  uId = cachHelper.getData(key: 'uId');
  if (uId != null){


      widget = HomePage();



  }else{

      widget = Login();
  }






  runApp(TadrebkApp(
      startWidget: widget
  ));

}



class TadrebkApp extends StatefulWidget{
   final Widget startWidget;
   TadrebkApp({required this.startWidget});




  @override
  State<TadrebkApp> createState() => _TadrebkAppState();
}

class _TadrebkAppState extends State<TadrebkApp> {

  @override
  void setState(VoidCallback fn) {
setState(() {    // TODO: implement setState
  ProfileCubit.get(context).getUserData();});
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

   return MultiBlocProvider(providers: [
     BlocProvider(
     create: (context) => LoginCubit(),
   ),
     BlocProvider(
       create: (context) => RegisterCubit(),
     ),

     BlocProvider(
       create: (context) => PostCubit(),
     ),

     BlocProvider(
       create: (context) => ProfileCubit(),
     ),

   ], child: MaterialApp(

   debugShowCheckedModeBanner: false,

   // home: widget.startWidget,
     home: TrainingCategories(
       Programming: 0,
       Contracting: 0,
       Marketing: 0,
       Accounting: 0,
       communications: 0,
     ),


    ),);




  }
}