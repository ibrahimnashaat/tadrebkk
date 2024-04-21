class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? image;
  String? city;
  String? street;
  String? uId;
  bool? isEmailVerified;
  String? isPerson;


  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.uId,
    required this.image,
    required this.city,
    required this.street,
    required this.isEmailVerified,
    required this.isPerson,


  });

  UserModel.fromJson(Map<String ,dynamic > json){

    firstName = json['firstName'];
    lastName = json['lastName'];
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
      'firstName' : firstName,
      'lastName' : lastName,
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
