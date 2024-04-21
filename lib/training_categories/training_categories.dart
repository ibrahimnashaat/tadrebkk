import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/get_trainings/get_all_trainings.dart';

import '../get_trainings/get _trainings_page.dart';
import '../shared/colors.dart';
import '../shared/components.dart';
import '../shared/fonts.dart';

class TrainingCategories extends StatefulWidget {
  const TrainingCategories({Key? key}) : super(key: key);

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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: mainColor,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: Colors.grey.withOpacity(0.5),
                            size: 20,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color:Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                      category(
                        context,
                          'assets/images/img_24.png',
                          'Programming(54)'
                      ),


                      category(
                          context,
                          'assets/images/img_25.png',
                          'Contracting(25K)'
                      ),

                      category(
                          context,
                          'assets/images/img_26.png',
                          'Marketing(500)'
                      ),

                      category(
                          context,
                          'assets/images/img_27.png',
                          'Accounting(15K)'
                      ),

                      category(
                          context,
                          'assets/images/img_28.png',
                          'communications(4)'
                      ),

                      category(
                          context,
                          'assets/images/img_29.png',
                          'Law(10K)'
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
                        .collection('posts')
                        .snapshots(),
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
                              trainingSpecialization:
                              data['trainingSpecialization'],
                              trainingCost: data['trainingCost'],
                              trainingDescription:
                              data['trainingDescription'],
                              startDate: data['startDate'],
                              endDate: data['endDate'],
                              context: context,
                            );
                          }
                          if (data['companyName']
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => GetTrainings()),
                            (route) => false);
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
