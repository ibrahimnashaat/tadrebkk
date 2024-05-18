import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/add_training/cubit.dart';
import 'package:tadrebk/shared/cach_helper.dart';
import 'package:tadrebk/shared/components.dart';

import '../shared/colors.dart';
import '../shared/fonts.dart';

class Payment extends StatefulWidget {
  final String trainingDescription;
  final String companyName;
  final String trainingName;
  final String trainingSpecialization;
  final String trainingCost;
  final String startDate;
  final String endDate;
  final String city;
  final String street;
  final String category;
  final String image;
  final String id;
  final String isLiked;
  final String isPaid;

  const Payment({super.key,
    required this.trainingDescription,
    required this.companyName,
    required this.trainingName,
    required this.trainingSpecialization,
    required this.trainingCost,
    required this.startDate,
    required this.endDate,
    required this.city,
    required this.street,
    required this.category,
    required this.image,
    required this.id,
    required this.isLiked,
    required this.isPaid,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {


  final _formKey = GlobalKey<FormState>();
  String selectedDateText = '';

  @override
  Widget build(BuildContext context){
  final windowWidth = MediaQuery.of(context).size.width;
  final windowHeight = MediaQuery.of(context).size.height;

    return windowWidth >=1100 && windowHeight >=600 ? AlertDialog(
      title: Row(
        children: [
          LocaleText('paying_off',

            style: TextStyle(
                fontFamily: mainFont,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          Spacer(),
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.close,
              size: 16,
            ),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          LocaleText('payment_method',

            style: TextStyle(
                fontFamily: mainFont
            ),

          ),
          SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.14,
                height: MediaQuery.of(context).size.height*0.06,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: mainColor,
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LocaleText('card_payment',

                      style: TextStyle(
                          fontFamily: mainFont,
                          fontSize: 12
                      ),
                    ),
                    Icon(
                      Icons.payment,
                      color: mainColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.14,
                height: MediaQuery.of(context).size.height*0.06,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LocaleText('pay_cash',

                      style: TextStyle(
                          fontFamily: mainFont,
                          fontSize: 12
                      ),
                    ),
                    Icon(
                      Icons.money,
                      color: Colors.lightGreen,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(
            height: 40,
          ),

          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                    color: mainColor

                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocaleText('card_number',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: mainFont,
                            color: mainColor
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        height: 34,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: TextEditingController(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'this field is empty';
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: '8976 5467 xx87 0098',

                            hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                            focusColor: Colors.white,
                            focusedBorder: OutlineInputBorder(

                              borderSide: BorderSide(
                                color: mainColor,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(

                              borderSide: BorderSide(
                                color:mainColor,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(

                              borderSide: BorderSide(
                                color: mainColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(

                              borderSide: BorderSide(
                                color: mainColor,
                              ),
                            ),
                            suffixIcon: Icon(Icons.payment,color: mainColor,size: 16,),
                          ),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),



                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.24,
                    height: MediaQuery.of(context).size.height*0.1,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.11,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LocaleText('cvv',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: mainFont,
                                    color: mainColor
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                height: 34,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: TextEditingController(),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'this field is empty';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    hintText: '* * *',

                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                                    focusColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(

                                      borderSide: BorderSide(
                                        color: mainColor,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(

                                      borderSide: BorderSide(
                                        color:mainColor,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(

                                      borderSide: BorderSide(
                                        color: mainColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(

                                      borderSide: BorderSide(
                                        color: mainColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.11,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LocaleText('expiry_date',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: mainFont,
                                    color: mainColor
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              // SizedBox(
                              //   height: 34,
                              //   child: TextFormField(
                              //     keyboardType: TextInputType.emailAddress,
                              //     controller: TextEditingController(),
                              //     validator: (value) {
                              //       if (value == null || value.isEmpty) {
                              //         return 'this field is empty';
                              //       }
                              //     },
                              //     decoration: InputDecoration(
                              //       filled: true,
                              //       fillColor: Colors.transparent,
                              //       hintText: '12/2026',
                              //
                              //       hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                              //       focusColor: Colors.white,
                              //       focusedBorder: OutlineInputBorder(
                              //
                              //         borderSide: BorderSide(
                              //           color: mainColor,
                              //         ),
                              //       ),
                              //       focusedErrorBorder: OutlineInputBorder(
                              //
                              //         borderSide: BorderSide(
                              //           color:mainColor,
                              //         ),
                              //       ),
                              //       disabledBorder: OutlineInputBorder(
                              //
                              //         borderSide: BorderSide(
                              //           color: mainColor,
                              //         ),
                              //       ),
                              //       enabledBorder: OutlineInputBorder(
                              //
                              //         borderSide: BorderSide(
                              //           color: mainColor,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),



                          SizedBox(
                          height: 34,
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: ColorScheme.light().copyWith(
                                        primary: mainColor, // تعيين لون الزر الرئيسي
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (selectedDate != null) {
                                setState(() {
                                  selectedDateText = '${selectedDate.month}/${selectedDate.year}';
                                });
                              }
                            },
                            child: AbsorbPointer(
                              child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                controller: TextEditingController(text: selectedDateText),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'this field is empty';
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  hintText: 'Select Date',
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                  focusColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: mainColor,
                                    ),
                                  ),
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
          ),

          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(

                    top: 30
                ),
                child: InkWell(
                  onTap: (){
                    if (_formKey.currentState!.validate()) {

                      PostCubit.get(context).updatePost(
                          companyName: widget.companyName,
                          city: widget.city,
                          street: widget.street,
                          trainingSpecialization: widget.trainingSpecialization,
                          trainingCost: widget.trainingCost,
                          trainingDescription: widget.trainingDescription,
                          startDate: widget.startDate,
                          endDate: widget.endDate,
                          trainingName: widget.trainingName,
                          category: widget.category,
                          id: widget.id,
                        isLiked:widget.isLiked ,
                        isPaid: 'true',
                        image: widget.image
                      );

                      cachHelper.saveData(key: 'isPaid', value: true);

                      Navigator.pop(context);
                      showToast(msg: 'Paid Successfully', state:ToastStates.SUCCESS );

                    }



                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    height: MediaQuery.of(context).size.width*0.03,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [HexColor('#1B3358'), mainColor],
                      ),
                    ),
                    child: Center(
                      child: Text('Pay now',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18
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

    ) : Container();
  }
}
