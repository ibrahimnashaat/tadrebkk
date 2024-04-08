class CompanyModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? city;
  String? street;
  String? specialization;
  String? isPerson;

  String? image;


  String? uId;
  bool? isEmailVerified;


  CompanyModel({
    required this.name,
    required this.specialization,
    required this.phoneNumber,
    required this.city,
    required this.street,
    required this.isPerson,

    required this.email,

    required this.uId,
    required this.image,


    required this.isEmailVerified,

  });

  CompanyModel.fromJson(Map<String ,dynamic > json){

    name = json['name'];
    specialization = json['specialization'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
    street = json['street'];
    email = json['email'];

    uId = json['uId'];
    image = json['image'];


    isEmailVerified = json['isEmailVerified'];
    isPerson = json['isPerson'];

  }

  Map<String, dynamic>  toMap (){

    return {
      'name' : name,
      'specialization' : specialization,
      'phoneNumber' : phoneNumber,
      'city' : city,
      'street' : street,
      'email' : email,

      'uId' : uId,
      'image':image,

      'isEmailVerified':isEmailVerified,
      'isPerson':isPerson,
    };

  }
}
