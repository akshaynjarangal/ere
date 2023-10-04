import 'package:ereakshay/src/data/service/post_service.dart';

import '../model/post_model.dart';

class PostRepo {
  final PostService postService;
  PostRepo({required this.postService});

  Future<List<UserFeed>> get getPost async{
   return postService.userPost;
  }

}