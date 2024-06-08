import 'dart:typed_data';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/shared/constant.dart';

import 'model.dart';
import 'states.dart';

import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;




class PostCubit extends Cubit<PostStatus> {
  PostCubit() : super(InitialStates());

  static PostCubit get(context) => BlocProvider.of(context);


  Uint8List? postImage;
  var picker = ImagePicker();

  getPostImage() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      postImage = await pickedFile.readAsBytes();
      emit(PostPeckerSuccessStates());
      print('image selected');
    } else {
      print('No Image Selected!');
      emit(PostPeckerErrorStates());
    }
  }

  void removePostImage() {
    postImage = null;

    emit(RemovePostImage());
  }

  void uploadPost({

    required companyName,
    required trainingName,
    required category,
    required city,
    required street,
    required trainingSpecialization,
    required trainingCost,
    required trainingDescription,
    required startDate,
    required endDate,
    required context,


  }) {
    emit(CreatePostLoadingStates());

    final firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance.ref().child("posts/${DateTime
        .now()
        .millisecondsSinceEpoch}.jpg");
    final firebase_storage.UploadTask uploadTask = storageRef.putData(
        postImage!);

    uploadTask.then((firebase_storage.TaskSnapshot taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((downloadURL) {
        print('File available at: $downloadURL');

        createPost(

          image: downloadURL,
          companyName: companyName,
          category: category,
          trainingName: trainingName,
          city: city,
          street: street,
          trainingSpecialization: trainingSpecialization,
          trainingCost: trainingCost,
          trainingDescription: trainingDescription,
          startDate: startDate,
          endDate: endDate,

        );
      }).catchError((onError) {
        print('Upload error: $onError');
        emit(CreatePostErrorStates());
      });
    }).catchError((onError) {
      print('No image selected!');
      emit(CreatePostErrorStates());
    });
  }


  PostModel? postModel;



  void createPost({
    String? image,
    required String companyName,
    required String city,
    required String street,
    required String trainingSpecialization,
    required String trainingCost,
    required String trainingDescription,
    required String startDate,
    required String endDate,
    required String trainingName,
    required String category,
  }) {
    PostModel model = PostModel(
      isLiked: 'false',
      uId: '',
      companyUid:uId??'',
      image: image,
      companyName: companyName,
      category: category,
      trainingName: trainingName,
      city: city,
      street: street,
      trainingSpecialization: trainingSpecialization,
      trainingCost: trainingCost,
      trainingDescription: trainingDescription,
      startDate: startDate,
      endDate: endDate,
      isPaid: 'false',
      paymentUid:'',
    );

    FirebaseFirestore.instance.collection("posts").add(model.toMap()).then((
        DocumentReference documentReference) async {


      updatePost(

        image: image,
        companyName: companyName,
        category: category,
        trainingName: trainingName,
        city: city,
        street: street,
        trainingSpecialization: trainingSpecialization,
        trainingCost: trainingCost,
        trainingDescription: trainingDescription,
        startDate: startDate,
        endDate: endDate,
        id:documentReference.id,

      );
      emit(CreatePostSuccessStates());

    }).catchError((e) {
      emit(CreatePostErrorStates());
    });
  }

  Future<void> updatePost({
    String? image,
    required String companyName,
    required String city,
    required String street,
    required String trainingSpecialization,
    required String trainingCost,
    required String trainingDescription,
    required String startDate,
    required String endDate,
    required String trainingName,
    required String category,
    required String id,
     String? isLiked,
     String? isPaid,
     String? paymentUid,
  }) async {




    PostModel model = PostModel(
      isLiked: isLiked ??'false',
      companyUid: FirebaseAuth.instance.currentUser!.uid??'',
      isPaid: isPaid??'false',
      paymentUid:FirebaseAuth.instance.currentUser!.uid??'',
      uId: id,
      image: image,
      companyName: companyName,
      category: category,
      trainingName: trainingName,
      city: city,
      street: street,
      trainingSpecialization: trainingSpecialization,
      trainingCost: trainingCost,
      trainingDescription: trainingDescription,
      startDate: startDate,
      endDate: endDate,
    );

    FirebaseFirestore.instance.collection("posts").doc(id).update(
        model.toMap()).then((value) {
      print;
      emit(UpdatePostSuccessStates());
    }).catchError((e) {
      emit(UpdatePostErrorStates());
    });




  }




  Future<Map<String, int>> countCoursesByCategory() async {
    final QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('posts').get();

    final Map<String, int> courseCounts = {};

    querySnapshot.docs.forEach((doc) {
      final data = doc.data() as Map<String, dynamic>;

      // Check if 'category' is a list or a single value
      if (data['category'] is List<dynamic>) {
        final categories = data['category'] as List<dynamic>;
        categories.forEach((category) {
          courseCounts[category] = (courseCounts[category] ?? 0) + 1;
        });
      } else if (data['category'] is String) {
        final category = data['category'] as String;
        courseCounts[category] = (courseCounts[category] ?? 0) + 1;
      }
    });

    return courseCounts;
  }











}