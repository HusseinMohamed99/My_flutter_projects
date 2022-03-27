abstract class SocialStates{}

class SocialInitialState extends SocialStates{}


//---------------------  Get User  --------------------------------//
class SocialLoadingState extends SocialStates{}

class SocialGetUserSuccessState extends SocialStates{}

class SocialGetUserErrorState extends SocialStates{

  final String error;

  SocialGetUserErrorState(this.error);
}

//---------------------  Get All User  --------------------------------//
class SocialGetAllUsersLoadingState extends SocialStates{}

class SocialGetAllUsersSuccessState extends SocialStates{}

class SocialGetAllUsersErrorState extends SocialStates{

  final String error;

  SocialGetAllUsersErrorState(this.error);
}



//---------------------  Bottom NavBar  --------------------------------//
class SocialBottomNavBarState extends SocialStates{}


//---------------------  Add Post  --------------------------------//
class SocialAddNewPostState extends SocialStates{}


//---------------------  Get Profile Image  --------------------------------//
class SocialProfileImageSuccessState extends SocialStates{}

class SocialProfileImageErrorState extends SocialStates{}


//---------------------  Get Cover Image  --------------------------------//
class SocialCoverImageSuccessState extends SocialStates{}

class SocialCoverImageErrorState extends SocialStates{}



//---------------------  Upload Profile Image  --------------------------------//
class SocialUploadProfileImageSuccessState extends SocialStates{}

class SocialUploadProfileImageErrorState extends SocialStates{}



//---------------------  Upload Cover Image  --------------------------------//
class SocialUploadCoverImageSuccessState extends SocialStates{}

class SocialUploadCoverImageErrorState extends SocialStates{}



//---------------------  User Update  --------------------------------//
class SocialUserUpdateLoadingState extends SocialStates{}

class SocialUserUpdateSuccessState extends SocialStates{}

class SocialUserUpdateErrorState extends SocialStates{}


//---------------------  Create Post  --------------------------------//
class SocialCreatePostLoadingState extends SocialStates{}

class SocialCreatePostSuccessState extends SocialStates{}

class SocialCreatePostErrorState extends SocialStates{}

class SocialPostImageSuccessState extends SocialStates{}

class SocialPostImageErrorState extends SocialStates{}

class SocialRemovePostImageState extends SocialStates{}


//---------------------  Get Posts --------------------------------//
class SocialPostLoadingState extends SocialStates{}

class SocialGetPostSuccessState extends SocialStates{}

class SocialGetPostErrorState extends SocialStates{

  final String error;

  SocialGetPostErrorState(this.error);
}

//---------------------  Like Posts --------------------------------//
class SocialLikePostSuccessState extends SocialStates{}

class SocialLikePostErrorState extends SocialStates{

  final String error;

  SocialLikePostErrorState(this.error);
}

//---------------------  comments Posts --------------------------------//
class SocialCommentsPostSuccessState extends SocialStates{}

class SocialCommentsPostErrorState extends SocialStates{

  final String error;

  SocialCommentsPostErrorState(this.error);
}

//---------------------  Send & Get Messages in Chats --------------------------------//
class SocialSendMessagesSuccessState extends SocialStates{}

class SocialSendMessagesErrorState extends SocialStates{}

class SocialGetMessagesSuccessState extends SocialStates{}

class SocialGetMessagesErrorState extends SocialStates{}