


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/sign_up_screen/cubit.dart';
import 'package:tadrebk/sign_up_screen/sign_up.dart';

import 'add_training/cubit.dart';
import 'add_training/post.dart';
import 'get_trainings/get_all_trainings.dart';
import 'login_screen/cubit.dart';
import 'login_screen/login.dart';

Future<void> main() async {

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

  runApp(TadrebkApp());

}



class TadrebkApp extends StatelessWidget{



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

   ], child: MaterialApp(

   debugShowCheckedModeBanner: false,

   home: Post(),


    ),);




  }




}