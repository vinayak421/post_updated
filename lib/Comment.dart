import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post/model/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:post/model/Sample.dart';

class Comment extends StatefulWidget{
   Sample post;

   Comment(this.post);

   _Comment createState()=>_Comment();
}




class _Comment extends State<Comment>{
  int comment =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
            child:Column(
              children: [
                InkWell(
                    child: Text(widget.post.body)),
                Text('No.of Comments : ${widget.post.no_Of_comments.toString()}'),
              ],
            )


        ),
      ),
    );
  }

}