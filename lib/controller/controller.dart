


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post/model/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:post/model/Sample.dart';


class PostList extends GetxController {
  var items = <Sample>[].obs;
  var comments = 0.obs;
  var name = ''.obs;
  int comment = 0;
  List<Sample> list = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    //



    var url = "https://jsonplaceholder.typicode.com/posts";
      var response = await http.get(Uri.parse(url));
      if(response.statusCode ==200){
        print(response.body);
        var array1 =jsonDecode(response.body);
        for(var object in array1){
          Post post = Post(userId:object['userId'], id:object['id'],title:object['title'] ,body:object['body'] );
          print('coming 12121212');
          var url2 = "https://jsonplaceholder.typicode.com/posts/${post.id}/comments";
          var response2 = await http.get(Uri.parse(url2));
          var array3,array2;
          if(response2.statusCode ==200){
            print(response2.body);
            array3 =jsonDecode(response2.body);
            comments.value = array3.length;
            print('comment $comments');
          }

          var url1 = "https://jsonplaceholder.typicode.com/users/${post.userId}";
          var response1 = await http.get(Uri.parse(url1));
          if(response1.statusCode ==200){
            print(response1.body);
             array2 =jsonDecode(response1.body);
            name.value = array2['name'];
            print('comment $comments');
          }

         Sample sample = Sample(name: array2['name'], no_Of_comments: array3.length, body: post.body);
          list.add(sample);
        }
        print('coming  ${list.length}');

        items.value = list;
      }

    }


  }


