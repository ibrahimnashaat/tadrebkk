import 'package:flutter/material.dart';

import 'colors.dart';

Widget workID (
    {
      required String title,
      required String image,
      required String description,
      required String requirements,
      required BuildContext context,
      required String email,

    }
    ) => Container(
  height: MediaQuery.of(context).size.height,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Colors.grey,
  ),
  child: Column(
    children: [
      Expanded(
        flex: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('$title',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w900,
                        color: mainColor.withOpacity(0.7),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  title.toLowerCase() =='web' ? Expanded(

                    child: RawMaterialButton(
                      onPressed: () {


                      },
                      shape: const StadiumBorder(),
                      fillColor: mainColor,
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                        child: Text(
                          "Exam",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ) :Container(),
                ],
              ),

              SizedBox(
                height: 2,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 340,
                            width: 240,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainColor

                            ),
                          ),
                          Container(
                            height: 320,
                            width: 220,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: image == '' ? const AssetImage('assets/images/img.png')as ImageProvider:NetworkImage('$image'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(

                          left: 10.0,

                        ),
                        child: SizedBox(
                          width: 100,
                          height: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(

                                children: [
                                  Icon(Icons.description_outlined,
                                    color: mainColor.withOpacity(0.7),
                                  ),
                                  SizedBox(
                                    width: 1.0,
                                  ),
                                  Expanded(
                                    child: Text('Description',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: mainColor.withOpacity(0.7)
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 2,),
                              Expanded(
                                child: Text('$description',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: mainColor.withOpacity(0.5)
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 2,),
                              Row(

                                children: [
                                  Icon(Icons.refresh,
                                    color: mainColor.withOpacity(0.7),
                                  ),
                                  SizedBox(
                                    width: 1.0,
                                  ),
                                  Expanded(
                                    child: Text('Requirements',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: mainColor.withOpacity(0.7)
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 2,),
                              Expanded(
                                child: Text('$requirements',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: mainColor.withOpacity(0.5)
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
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
      ),

      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 8
          ),
          child: MaterialButton(

            color: mainColor.withOpacity(0.8),


            onPressed: () {

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.upload_outlined,
                  color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                  size: 28,
                ),

              ],
            ),
          ),
        ),
      ),
    ],
  ),
);