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
    print('coming  32323 ${controller.items.length}');
  }




  @override
  Widget build(BuildContext context) {
    print('coming  3232 ${controller.items.length}');
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: GetX<PostList>(
              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (BuildContext context ,int index)
                        {
                          return Card(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 20.0),
                                  child: CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  radius: 30.0,
                                  child: Text(getInitials(controller.items[index].name), style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),)),
                                ),

                                InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Comment(controller.items[index])));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 20.0),
                                        child: Text(controller.items[index].body))),


                                Container(
                                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 20.0),
                                  child: Row(
                                    children: [
                                      Text('Comments ')
                                      ,
                                      CircleAvatar(
                                          backgroundColor: Colors.greenAccent,
                                          radius: 15.0,
                                          child: new Text(controller.items[index].no_Of_comments.toString(), style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.0),)),


                                    ],

                                  ),
                                ),
                                Divider(thickness: 2,color: Colors.grey,height: 1,),

                              ],
                            )


                          );
                        }

                );
              }
            ),

        ),
      ),
    );
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';

}