import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/get_trainings/get_all_trainings.dart';

import '../shared/colors.dart';
import '../shared/components.dart';
import '../shared/fonts.dart';

class GetTrainings extends StatefulWidget {
  const GetTrainings({Key? key}) : super(key: key);

  @override
  State<GetTrainings> createState() => _GetTrainingsState();
}

class _GetTrainingsState extends State<GetTrainings> {
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
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      children: [
                        Text(
                          'All',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Training',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontFamily: mainFont,
                              color: mainColor),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Of',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Tadrebk',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100,right: 100, top: 20,bottom: 40),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.08,
                    width: MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                        color: HexColor('#B5C9E7'),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 80,),
                        category(context, 'programming'),
                        category(context, 'Contracting'),
                        category(context, 'Marketing'),
                        category(context, 'Accounting'),
                        category(context, 'Communication'),
                        SizedBox(width: 80,),
                      ],
                    ),
                  ),
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
                        itemCount: 6,
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
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>GetAllTrainings()), (route) => false);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.05,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      color: HexColor('#B5C9E7'),
                      borderRadius: BorderRadius.circular(10),
                      border:Border.all(
                          color: mainColor,
                          width: 2
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Other Courses',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                            color: mainColor
                        ),
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
    name,

    ){
  return Container(
    height: MediaQuery.of(context).size.width * 0.04,
    width: MediaQuery.of(context).size.width * 0.1,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
    ),
    child: Center(
      child: Text(
        '$name',
        style: TextStyle(
            fontFamily: mainFont,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: mainColor
        ),
      ),
    ),
  );
}
