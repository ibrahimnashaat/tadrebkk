import 'dart:typed_data';


import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tadrebk/shared/constant.dart';

import 'model.dart';
import 'states.dart';

import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;




class PostCubit extends Cubit<PostStatus> {
  PostCubit() : super(InitialStates());
  static PostCubit get(context) => BlocProvider.of(context);



  Uint8List? postImage;
  var picker =ImagePicker();
   getPostImage() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
     postImage = await pickedFile.readAsBytes();
      emit( PostPeckerSuccessStates ());
      print('image selected');
    } else {
      print('No Image Selected!');
      emit(PostPeckerErrorStates());
    }

  }

  void removePostImage (){

     postImage= null ;

     emit(RemovePostImage());

  }

  void uploadPost({

    required companyName,
    required city,
    required street,
    required trainingSpecialization,
    required trainingCost,
    required trainingDescription,
    required startDate,
    required endDate,
    required context,


  })
  {
    emit( CreatePostLoadingStates());

    final firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref().child("posts/${DateTime.now().millisecondsSinceEpoch}.jpg");
    final firebase_storage.UploadTask uploadTask = storageRef.putData(postImage!);

    uploadTask.then((firebase_storage.TaskSnapshot taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((downloadURL) {
        print('File available at: $downloadURL');

        createPost(

          image: downloadURL,
          companyName: companyName,
          city: city,
          street: street,
          trainingSpecialization: trainingSpecialization,
          trainingCost: trainingCost,
          trainingDescription: trainingDescription,
          startDate: startDate,
          endDate: endDate,

        );





      }).catchError((onError){
        print('Upload error: $onError');
        emit(CreatePostErrorStates());
      });




          }).catchError((onError){

      print('No image selected!');
      emit(CreatePostErrorStates());
    });

  }


  PostModel? postModel;

  void createPost(
      {

        String? image,
        required companyName,
        required city,
        required street,
        required trainingSpecialization,
        required trainingCost,
        required trainingDescription,
        required startDate,
        required endDate,

      }) {




    PostModel model = PostModel(


      uId: uId,
      image: image,
      companyName: companyName,
      city: city,
      street: street,
      trainingSpecialization: trainingSpecialization,
      trainingCost: trainingCost,
      trainingDescription: trainingDescription,
      startDate: startDate,
      endDate: endDate,



    );
    FirebaseFirestore.instance.collection("posts").add(model.toMap()).then((value) {
      emit(CreatePostSuccessStates());
    }).catchError((e) {
      emit(CreatePostErrorStates());
    });
  }

}