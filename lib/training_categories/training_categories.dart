import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/add_training/cubit.dart';
import 'package:tadrebk/get_trainings/get_all_trainings.dart';
import 'package:tadrebk/training_categories/category_pages.dart';

import '../get_trainings/get _trainings_page.dart';
import '../shared/colors.dart';
import '../shared/components.dart';
import '../shared/fonts.dart';
import '../shared/header_widget.dart';
import '../training_details/training_details.dart';

class TrainingCategories extends StatefulWidget {
  final int Programming;
  final int Contracting;
  final int Accounting;
  final int Marketing;
  final int communications;


  TrainingCategories({
    required this.Programming,
    required this.Contracting,
    required this.Marketing,
    required this.Accounting,
    required this.communications,

  });

  @override
  State<TrainingCategories> createState() => _TrainingCategoriesState();
}

class _TrainingCategoriesState extends State<TrainingCategories> {
  String name = '';



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              index: 1,
            ),

            Column(

              children: [
                SizedBox(height: 20),

                Container(
                  // height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.52,

                  child: Column(
                    children: [
                      Text('Training Categories',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: mainFont,
                        color: mainColor,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: 20),
                      Text('Provide most popular courses that your want to join and lets start the course for the most simply way in here',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: mainFont,
                        color: mainColor,
                        fontWeight: FontWeight.bold
                      ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),


                ),

                Padding(
                  padding: const EdgeInsets.only(left: 50,right: 50, top: 20,bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return CategoryPages(categoryName: 'Programming',);
                              })
                          );
                        },
                        child: category(
                          context,
                            'assets/images/img_24.png',
                            'Programming(${widget.Programming})'
                        ),
                      ),


                      InkWell(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return CategoryPages(categoryName: 'Contracting',);
                              })
                          );
                        },
                        child: category(
                            context,
                            'assets/images/img_25.png',
                            'Contracting(${widget.Contracting})'
                        ),
                      ),

                      InkWell(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return CategoryPages(categoryName: 'Marketing',);
                              })
                          );
                        },
                        child: category(
                            context,
                            'assets/images/img_26.png',
                            'Marketing(${widget.Marketing})'
                        ),
                      ),

                      InkWell(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return CategoryPages(categoryName: 'Accounting',);
                              })
                          );
                        },
                        child: category(
                            context,
                            'assets/images/img_27.png',
                            'Accounting(${widget.Accounting})'
                        ),
                      ),

                      InkWell(
                        onTap:(){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return CategoryPages(categoryName: 'communications',);
                              })
                          );
                        },
                        child: category(
                            context,
                            'assets/images/img_28.png',
                            'communications(${widget.communications})'
                        ),
                      ),

                      InkWell(
                          onTap: (){

                          },
                        child: category(
                            context,
                            'assets/images/img_29.png',
                            'Law(-)'
                        ),
                      ),


                    ],
                  ),
                ),

                Container(
                  // height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.52,

                  child: Column(
                    children: [
                      Text('Featured Training',
                        style: TextStyle(
                            fontSize: 32,
                            fontFamily: mainFont,
                            color: mainColor,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Provide most popular courses that your want to join and lets start the course for the most simply way in here',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: mainFont,
                            color: mainColor,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),


                ),
                SizedBox(
                  height: 20,
                ),
                Padding(

                  padding: const EdgeInsets.only(
                    left:100.0,
                    right: 100.0,
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('posts').
                        snapshots(),
                    builder: (context, snapshots) {
                      return (snapshots.connectionState ==
                          ConnectionState.waiting)
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),

                        shrinkWrap: true,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:3,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 0.88, // Adjust the aspect ratio as needed

                        ),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          var data = snapshots.data!.docs[index]
                              .data() as Map<String, dynamic>;
                          if (name.isEmpty) {
                            return trainingID(
                              image: data['image'] ?? '',
                              companyName: data['companyName'],
                              city: data['city'],
                              street: data['street'],
                              trainingSpecialization: data['trainingSpecialization'],
                              trainingCost: data['trainingCost'],
                              trainingDescription: data['trainingDescription'],
                              startDate: data['startDate'],
                              endDate: data['endDate'],
                              category: data['category'],
                              trainingName: data['trainingName'],
                              id:data['uId'],
                              isLiked: data['isLiked'],
                              isPaid: data['isPaid']??'',
                              context: context,
                            );
                          }
                          if (data['trainingName']
                              .toString()
                              .toLowerCase()
                              .startsWith(name.toLowerCase())) {
                            return trainingID(
                              image: data['image'] ?? '',
                              companyName: data['companyName'],
                              city: data['city'],
                              street: data['street'],
                              trainingSpecialization:
                              data['trainingSpecialization'],
                              trainingCost: data['trainingCost'],
                              trainingDescription:
                              data['trainingDescription'],
                              startDate: data['startDate'],
                              endDate: data['endDate'],
                              category: data['category'],
                              trainingName: data['trainingName'],
                              id:data['uId'],
                              isLiked: data['isLiked'],
                              isPaid: data['isPaid']??'',
                              context: context,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetTrainings()),
                           );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.14,
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
                        'View All Trainings',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 60,
                ),
                footerPage(context),
              ],
            ),
          ],
        ),
      ),
    );


  }
}


Widget category (
    context,
image,
    text

    ){
  return Column(
    children: [
      Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(image,
          height: MediaQuery.of(context).size.width * 0.12,
          width: MediaQuery.of(context).size.width*0.13,
          fit: BoxFit.cover,
        ),
      ),
      Text(text,

        style: TextStyle(
          color: mainColor,
          fontSize: 12,
          fontFamily: mainFont,

        ),

      ),                       ],
  );
}
