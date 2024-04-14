abstract class PostStatus{}
class InitialStates extends PostStatus{}

//create post
class CreatePostLoadingState extends PostStatus {}

class CreatePostSuccessState extends PostStatus {}

class CreatePostErrorState extends PostStatus {}
class PostImagePeckerSuccessStates extends  PostStatus{}
class PostImagePeckerErrorStates extends  PostStatus{}
class RemovePostImageState extends  PostStatus{}
//
class GetPostsLoadingStates extends PostStatus{}
class GetPostsSuccessStates extends PostStatus{}
class GetPostsErrorStates extends PostStatus
{
  final String error;
  GetPostsErrorStates(this.error);
}



class CreatePostLoadingStates extends PostStatus {}

class CreatePostSuccessStates extends PostStatus {}

class CreatePostErrorStates extends PostStatus {

}

class PostPeckerSuccessStates extends  PostStatus{}
class PostPeckerErrorStates extends  PostStatus{}

class RemovePostImage extends  PostStatus{}
