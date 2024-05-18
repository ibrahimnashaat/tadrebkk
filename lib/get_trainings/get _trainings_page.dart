import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/get_trainings/get_all_trainings.dart';

import '../shared/colors.dart';
import '../shared/components.dart';
import '../shared/fonts.dart';
import '../shared/header_widget.dart';
import '../training_categories/category_pages.dart';

class GetTrainings extends StatefulWidget {
  const GetTrainings({Key? key}) : super(key: key);

  @override
  State<GetTrainings> createState() => _GetTrainingsState();
}

class _GetTrainingsState extends State<GetTrainings> {
  String name = '';

  @override
  Widget build(BuildContext context) {

    final windowWidth = MediaQuery.of(context).size.width;
    final windowHeight = MediaQuery.of(context).size.height;

    return  windowWidth >=1100 && windowHeight >=600 ?  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              index: 1,
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
                        LocaleText(
                          'all',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        LocaleText(
                          'training',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontFamily: mainFont,
                              color: mainColor),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                    LocaleText(
                          'of',
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
                        InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return CategoryPages(categoryName: 'Programming',);
                                  })
                              );
                            },
                            child: category(context, 'programming')),
                        InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return CategoryPages(categoryName: 'Contracting',);
                                  })
                              );
                            },
                            child: category(context, 'Contracting')),
                        InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return CategoryPages(categoryName: 'Marketing',);
                                  })
                              );
                            },
                            child: category(context, 'Marketing')),
                        InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return CategoryPages(categoryName: 'Accounting',);
                                  })
                              );
                            },
                            child: category(context, 'Accounting')),
                        InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return CategoryPages(categoryName: 'communications',);
                                  })
                              );
                            },
                            child: category(context, 'Communication')),
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
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GetAllTrainings()));
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
                      child: LocaleText(
                        'other_trainings',
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
    ) : Container();


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
