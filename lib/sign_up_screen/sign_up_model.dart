class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? city;
  String? street;

  String? image;

  String? isPerson;


  String? uId;
  bool? isEmailVerified;


  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.city,
    required this.street,
    required this.isPerson,

    required this.email,

    required this.uId,
    required this.image,


    required this.isEmailVerified,

  });

  UserModel.fromJson(Map<String ,dynamic > json){

    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
    street = json['street'];
    email = json['email'];

    uId = json['uId'];
    image = json['image'];
    isPerson = json['isPerson'];


    isEmailVerified = json['isEmailVerified'];

  }

  Map<String, dynamic>  toMap (){

    return {
      'firstName' : firstName,
      'lastName' : lastName,
      'phoneNumber' : phoneNumber,
      'city' : city,
      'street' : street,
      'email' : email,

      'uId' : uId,
      'image':image,
      'isPerson':isPerson,

      'isEmailVerified':isEmailVerified,
    };

  }
}
