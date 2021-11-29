


import 'package:get/get.dart';
import 'package:post/model/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PostList extends GetxController {
  List<Post> items = List<Post>.obs;
  List<Post> list = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
      var url = "https://jsonplaceholder.typicode.com/posts";
      var response = await http.get(Uri.parse(url));
      if(response.statusCode ==200){
        print(response.body);
        var array =jsonDecode(response.body);
        for(var object in array){
          Post post = Post(userId:object['userId'], id:object['id'],title:object['title'] ,body:object['body'] );
          list.add(post);
        }
      }
               items = list;
    }


  }


