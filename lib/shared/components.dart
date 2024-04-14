import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/shared/colors.dart';
import 'package:tadrebk/shared/fonts.dart';

Widget trainingID({
  required String city,
  required String image,
  required String street,
  required String companyName,
  required BuildContext context,
  required String trainingSpecialization,
  required String trainingCost,
  required String trainingDescription,
  required String startDate,
  required String endDate,
}) =>
    Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.12,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: image == ''
                    ? Image.asset('assets/images/img.png',fit: BoxFit.cover,)
                    : Image.network('$image',fit: BoxFit.cover,),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,),
                child: Expanded(
                  child: Text(companyName,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: mainFont
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,

                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20,top: 10,),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.02,
                  width: MediaQuery.of(context).size.width * 0.07,
                  color: HexColor('#B5C9E7'),
                  child: Expanded(
                    child: Center(
                      child: Text(trainingSpecialization,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: mainFont,
                            color: mainColor
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
            child: Expanded(
              child: Text(trainingDescription,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: mainFont,
                    fontWeight: FontWeight.w600
                ),

                maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,


              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 40,top: 10,),
            child: Row(
              children: [
                Icon(Icons.access_time_outlined,color: Colors.grey.withOpacity(0.5),size: 16,),
                Text(' 2h 40min',
                  style: TextStyle(
                    fontSize: 14,

                    fontFamily: mainFont,

                  ),
                ),

                Spacer(),

                Icon(Icons.local_library_outlined,color: Colors.grey.withOpacity(0.5),size: 16,),
                Text(' 15 Lectures',
                  style: TextStyle(
                    fontSize: 14,

                    fontFamily: mainFont,

                  ),
                ),
              ],
            ),
          ),
          Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 20 , right: 20,top: 10,bottom: 8),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.025,
              width: MediaQuery.of(context).size.width ,
             decoration: BoxDecoration(
               color: HexColor('#B5C9E7'),
               borderRadius: BorderRadius.circular(5)
             ),
              child: Expanded(
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          trainingCost,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: mainFont,
                            fontWeight: FontWeight.bold,
                            color: mainColor
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Text(
                              '4.9 ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: mainFont,
                                fontWeight: FontWeight.bold,
                                color: mainColor
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: mainColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: mainColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: mainColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: mainColor,
                              size: 16,
                            ),
                            Icon(
                              Icons.star_border,
                              color: mainColor,
                              size: 16,
                            ),


                          ],
                        ),
                      ),
                    ],
                  )

                ),
              ),
            ),
          ),

        ],
      ),
    );
