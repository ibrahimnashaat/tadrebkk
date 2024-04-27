class CompanyModel {
  String? name;
  String? specialization;
  String? email;
  String? phoneNumber;
  String? image;
  String? city;
  String? street;
  String? uId;
  bool? isEmailVerified;
  String? isPerson;



  CompanyModel({
    required this.name,
    required this.specialization,
    required this.email,
    required this.phoneNumber,
    required this.uId,
    required this.image,
    required this.city,
    required this.street,
    required this.isEmailVerified,
    required this.isPerson,


  });

  CompanyModel.fromJson(Map<String ,dynamic > json){

    name = json['name'];
    specialization = json['specialization'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    uId = json['uId'];
    image = json['image'];
    city = json['city'];
    street = json['street'];
    isEmailVerified = json['isEmailVerified'];
    isPerson = json['isPerson'];


  }

  Map<String, dynamic>  toMap (){

    return {
      'name' : name,
      'specialization' : specialization,
      'email' : email,
      'phoneNumber' : phoneNumber,
      'uId' : uId,
      'image':image,
      'city':city,
      'street':street,
      'isEmailVerified':isEmailVerified,
      'isPerson' : isPerson,
    };

  }
}
