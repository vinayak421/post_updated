import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post/model/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Comment extends StatefulWidget{
   Post post;

   Comment(this.post);

   _Comment createState()=>_Comment();
}




class _Comment extends State<Comment>{
  int comment =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchComment();
  }

  void fetchComment() async {
    print(widget.post.id);
    var url = "https://jsonplaceholder.typicode.com/posts/${widget.post.id}/comments";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode ==200){
      print(response.body);
      var array =jsonDecode(response.body);
      for(var object in array){
        setState(() {
          comment++;
        });

      }
      print('comment $comment');
    }
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
            child:Column(
              children: [
                Text(widget.post.title),
                InkWell(
                    child: Text(widget.post.body)),
                Text('No.of Comments : ${comment.toString()}'),
              ],
            )


        ),
      ),
    );
  }

}