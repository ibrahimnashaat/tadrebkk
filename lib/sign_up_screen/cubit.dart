import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadrebk/sign_up_screen/company_sign_up_model.dart';
import 'package:tadrebk/sign_up_screen/sign_up_model.dart';
import 'package:tadrebk/sign_up_screen/state.dart';






class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);







  void createUser (
      {
        required String firstName,
        required String lastName,
        required String phoneNumber,
        required String city,
        required String street,
        required String email,
        required String uId,
        required String isPerson,

      }
      ){


    UserModel model = UserModel(
      firstName : firstName,
      lastName : lastName,
      phoneNumber : phoneNumber,
      city : city,
      street : street,
      isPerson : isPerson,

      email:email,

      uId:uId,
      isEmailVerified: false,
      image : 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1662406827~exp=1662407427~hmac=f4e97a981b226aaed69a3eff8d2b1366a943f5ab21a48c33ded209f42068dce5',


    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {

      print('شغال');
      emit(RegisterCreateUserSuccessStates(uId: uId));
    }).catchError((error){
      print ('مش شغال');
      emit(RegisterCreateUserErrorStates(error.toString()));
    });

  }


  void userRegister({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String city,
    required String street,
    required String email,
    required String password,
    required String isPerson,
    required BuildContext context,


  }) {
    emit(RegisterLoadingStates());
    showDialog(
      context: context,
      builder:(context){
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,).then((value){
      print(value.user!.email);
      print(value.user!.uid);

      print('انت كدا تمام من ناحية ادخال البيانات');

      createUser(
        firstName : firstName,
        lastName : lastName,
        phoneNumber : phoneNumber,
        city : city,
        street : street,
        isPerson : isPerson,
        email:email,
        uId:value.user!.uid,

      );
      emit(RegisterSuccessStates());

    }).catchError((error){
      emit(RegisterErrorStates(error.toString()));
    });
  }



  IconData suffix = Icons.visibility_off;
  bool isNotVisible = true;

  void changePasswordVisibility() {
    isNotVisible = !isNotVisible;

    suffix = isNotVisible ? Icons.visibility_off : Icons.visibility;
    emit(PasswordStates());
  }















  void createCompany (
      {
        required String name,
        required String specialization,
        required String phoneNumber,
        required String city,
        required String street,
        required String email,
        required String uId,
        required String isPerson,

      }
      ){


    CompanyModel model = CompanyModel(
      name : name,
      specialization : specialization,
      phoneNumber : phoneNumber,
      city : city,
      street : street,
      isPerson : isPerson,

      email:email,

      uId:uId,
      isEmailVerified: false,
      image : 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=740&t=st=1662406827~exp=1662407427~hmac=f4e97a981b226aaed69a3eff8d2b1366a943f5ab21a48c33ded209f42068dce5',


    );

    FirebaseFirestore.instance.collection('companies').doc(uId).set(model.toMap()).then((value) {

      print('شغال');
      emit(RegisterCreateCompanySuccessStates(uId: uId));
    }).catchError((error){
      print ('مش شغال');
      emit(RegisterCreateCompanyErrorStates(error.toString()));
    });

  }


  void companyRegister({
    required String name,
    required String specialization,
    required String phoneNumber,
    required String city,
    required String street,
    required String email,
    required String password,
    required String isPerson,
    required BuildContext context,


  }) {
    emit(RegisterLoadingStates());
    showDialog(
      context: context,
      builder:(context){
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,).then((value){
      print(value.user!.email);
      print(value.user!.uid);

      print('انت كدا تمام من ناحية ادخال البيانات');

      createCompany(
        name : name,
        specialization : specialization,
        phoneNumber : phoneNumber,
        city : city,
        street : street,
        email:email,
        isPerson:isPerson,
        uId:value.user!.uid,

      );
      emit(RegisterSuccessStates());

    }).catchError((error){
      emit(RegisterErrorStates(error.toString()));
    });
  }














}