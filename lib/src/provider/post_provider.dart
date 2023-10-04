import 'package:ereakshay/src/data/model/post_model.dart';
import 'package:ereakshay/src/data/repository/post_repo.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  final PostRepo postRepo;
  PostProvider({required this.postRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  set _setSuccess (bool value){
    _isSuccess = value;
    notifyListeners();
  }

  set _setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }


  List<UserFeed> get posts => _posts;

  List<UserFeed> _posts = [];

  set _setList(List<UserFeed> list) {
    _posts = list;
    notifyListeners();
  }


  Future<void> get getUserPosts async {

    _setLoading = true;
    final res = await postRepo.getPost;
    if(res.isNotEmpty){
      _setLoading = false;
      _setSuccess = true;
      _setList = res;
    }
    else{
      _setLoading = false;
      _setSuccess = false;
      _setList = [];
    }

  }

}