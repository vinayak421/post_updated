import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Comment.dart';
import 'controller/controller.dart';

class Post extends StatefulWidget{
  _Post createState() => _Post();
}

class _Post extends State<Post>{
  final controller = Get.put(PostList());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (BuildContext context ,int index)
                  {
                    return Container(
                      child:Column(
                        children: [
                          Text(controller.items[index].title),
                          InkWell(
                              onTap: (){
                                Get.to(Comment(controller.items[index]));
                              },
                              child: Text(controller.items[index].body)),
                        ],
                      )


                    );
                  }

          ),

      ),
    );
  }

}