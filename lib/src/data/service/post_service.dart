import 'dart:convert';
import 'dart:developer';
import '../model/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostService {

  Future<List<UserFeed>> get userPost;

}

class PostImpl implements PostService {

  @override
  Future<List<UserFeed>> get userPost async{
    try {
      final uri = Uri.https('dummyapi.io','/data/v1/post');
      final res = await http.get(uri,headers: {
        "app-id":"63624d572c4963279137bac2"
      });
      if(res.statusCode == 200){
        final jsondata = jsonDecode(res.body);
        final decoded = (jsondata["data"] as List).map((e) => UserFeed.fromJson(e)).toList();
        return decoded;
      }
      else{
        return [];
      }
    } catch (e) {
      log('ERROR----> $e');
      return [];
    }
  }

}