// هيبقي CUBIT كبير لكله بس محتاج اعدله
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/cubit/state.dart';
import 'package:flutter_projects/models/message_model.dart';
import 'package:flutter_projects/models/post_model.dart';
import 'package:flutter_projects/models/user_model.dart';
import 'package:flutter_projects/modules/Chats/chats_screen.dart';
import 'package:flutter_projects/modules/Feeds/feeds_screen.dart';
import 'package:flutter_projects/modules/New_Posts/new_posts.dart';
import 'package:flutter_projects/modules/Settings/settings_screen.dart';
import 'package:flutter_projects/modules/Users/users_screen.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  //---------------------  Get User Data --------------------------------//
  SocialUserModel userModel;

  void getUserData() {
    emit(SocialLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModel = SocialUserModel.fromJson(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  //---------------------  Create List Item >> Bottom Navigation Bar IN Home_Screen  --------------------------------//
  int crruntIndex = 0;

  List<Widget> screens =
  [
    FeedsScreen(),
    ChatsScreen(),
    NewPostsScreens(),
    UsersScreen(),
    SettinsScreen(),
  ];

  List<String> titles =
  [
    'Social pup',
    'Chats',
    'New Post',
    'Users',
    'Settings',
  ];

  //---------------------  Change Bottom Navigation Bar IN Home_Screen  --------------------------------//
  void changeBottomNav(int index) {

    if(index == 0) {
      getPosts();
    }
    if(index == 1) {
      getAllUsers();
    }
    if (index == 2) {
      emit(SocialAddNewPostState());
    } else {
      crruntIndex = index;
      emit(SocialBottomNavBarState());
    }
  }


  //---------------------  Get ImagePicker Package  --------------------------------//
  File profileImage;
  var picker = ImagePicker();


  //---------------------  Get profile Image --------------------------------//
  Future <void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialProfileImageSuccessState());
    } else {
      print('No image selected');
      emit(SocialProfileImageErrorState());
    }
  }


  //---------------------  Get Cover Image --------------------------------//
  File coverImage;

  Future <void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);

      emit(SocialCoverImageSuccessState());
    } else {
      print('No image selected');

      emit(SocialCoverImageErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(SocialRemovePostImageState());
  }


  //---------------------  upload profile Image --------------------------------//
  void uploadProfileImage({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(profileImage.path)
        .pathSegments
        .last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL()
          .then((value) {
        //  emit(SocialUploadProfileImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      })
          .catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    })
        .catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }


  //---------------------  upload Cover Image --------------------------------//
  void uploadCoverImage({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(coverImage.path)
        .pathSegments
        .last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL()
          .then((value) {
        //  emit(SocialUploadCoverImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
      })
          .catchError((error) {
        emit(SocialUploadCoverImageErrorState());
      });
    })
        .catchError((error) {
      emit(SocialUploadCoverImageErrorState());
    });
  }


  //// ---------------------  تم حذفها في السشين  --------------------------------
  // ---------------------  update Cover Image --------------------------------//
  void updateUserImages({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    if (coverImage != null) {
      uploadCoverImage();
    }

    else if (profileImage != null) {
      uploadProfileImage();
    } else if (coverImage != null && profileImage != null) {

    }

    else {
      updateUser(
        name: name,
        phone: phone,
        bio: bio,
      );
    }
  }


  //---------------------  update User Data (name,phone, Bio) --------------------------------//
  void updateUser({
    @required String name,
    @required String phone,
    @required String bio,
    String cover,
    String image,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel.email,
      image: image ?? userModel.image,
      cover: cover ?? userModel.cover,
      uId: userModel.uId,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    })
        .catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }




//---------------------  Create  Post  --------------------------------//
  void createPost({
    @required String dateTime,
    @required String text,
    String postImage,
  }) {
    emit(SocialCreatePostLoadingState());

    PostModel model = PostModel(
      name: userModel.name,
      image: userModel.image,
      uId: userModel.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(SocialCreatePostSuccessState());
    })
        .catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }
//---------------------  Create New Post  --------------------------------//

  File postImage;
  Future <void> getPostImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);

      emit(SocialPostImageSuccessState());
    } else {
      print('No image selected');

      emit(SocialPostImageErrorState());
    }
  }
//---------------------  upload Post  --------------------------------//
  void uploadPostImage({
    @required String dateTime,
    @required String text,
  }) {
    emit(SocialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri
        .file(postImage.path)
        .pathSegments
        .last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL()
          .then((value) {
        print(value);
        createPost(
          dateTime: dateTime,
          text: text,
          postImage: value,
        );
      })
          .catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    })
        .catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }



//---------------------  Get Post  --------------------------------//
  List<PostModel> posts =[];

  List<String> postsId = [];

  List<int> likes = [];
  void getPosts()
  {

    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference
            .collection('comments')
            .get()
            .then((value) {
          postsId.add(element.id);
        }).catchError((error) {});

        element.reference
            .collection('likes')
            .get()
            .then((value) {
          likes.add(value.docs.length);
          postsId.add(element.id);

          posts.add(PostModel.fromJson(element.data()));
        })
            .catchError((error) {});
      });
      emit(SocialGetPostSuccessState());
    })
        .catchError((error) {
      emit(SocialGetPostErrorState(error.toString()));
    });
  }

//---------------------  likes Post  --------------------------------//
  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel.uId)
        .set({
      'like': true,
    })
        .then((value) {
      emit(SocialLikePostSuccessState());
    })
        .catchError((error) {
      emit(SocialLikePostErrorState(error.toString()));
    });
  }


//---------------------  Get All Users   --------------------------------//
  List<SocialUserModel> users =[];

  void getAllUsers()
  {
    users = [];
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      value.docs.forEach((element)
      {
        if(element.data()['uId'] != userModel.uId)
          users.add(SocialUserModel.fromJson(element.data()));
      });
      emit(SocialGetAllUsersSuccessState());
    }).catchError((error) {
      emit(SocialGetAllUsersErrorState(error.toString()));
    });
  }


//---------------------  Send & Get Messages in Chats --------------------------------//
  void sendMessages({
    @required String receiverId ,
    @required String dateTime ,
    @required String text ,
  })

  {
    MessageModel model = MessageModel(
      text: text,
      senderId: userModel.uId,
      receiverId: receiverId,
      dateTime: dateTime,
    );
    // set my chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('Chats')
        .doc(receiverId)
        .collection('Messages')
        .add(model.toMap())
        .then((value)
    {
      emit(SocialSendMessagesSuccessState());
    })
        .catchError((error)
    {
      emit(SocialSendMessagesErrorState());
    });
    // set receiver chats

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('Chats')
        .doc(userModel.uId)
        .collection('Messages')
        .add(model.toMap())
        .then((value)
    {
      emit(SocialGetMessagesSuccessState());
    })
        .catchError((error)
    {
      emit(SocialGetMessagesErrorState());
    });
  }

  List<MessageModel> messages =[];

  void getMessages({
    @required String receiverId ,

  })
  {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('Chats')
        .doc(receiverId)
        .collection('Messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event)
    {
      messages = [];
      event.docs.forEach((element)
      {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialGetMessagesSuccessState());
    });
  }

}
