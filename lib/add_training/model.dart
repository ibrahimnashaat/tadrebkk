
class PostModel {
  String? image;
  String? uId;


 String? companyName;
 String? city;
 String? street;
 String? trainingSpecialization;
 String? trainingCost;
 String? trainingDescription;
 String? startDate;
 String? endDate;



  PostModel({
    required this.companyName,
    required this.city,
    required this.uId,
    required this.image,
    required this.street,
    required this.trainingSpecialization,
    required this.trainingCost,
    required this.trainingDescription,
    required this.startDate,
    required this.endDate,

  });

  PostModel.fromJson(Map<String ,dynamic > json){

    companyName = json['companyName'];
    city = json['city'];
    uId = json['uId'];
    image = json['image'];
    street = json['street'];
    trainingSpecialization = json['trainingSpecialization'];
    trainingCost = json['trainingCost'];
    trainingDescription = json['trainingDescription'];
    startDate = json['startDate'];
    endDate = json['endDate'];


  }

  Map<String, dynamic>  toMap (){

    return {
      'uId' : uId,
      'image':image,
      'companyName':companyName,
      'city':city,
      'street':street,
      'trainingSpecialization':trainingSpecialization,
      'trainingCost':trainingCost,
      'trainingDescription':trainingDescription,
      'startDate':startDate,
      'endDate':endDate,

    };

  }
}
