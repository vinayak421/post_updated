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
                          return Container(
                            child:Column(
                              children: [
                                Text(controller.items[index].title,style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(
                                  height: 20.0,
                                ),
                                InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Comment(controller.items[index])));
                                    },
                                    child: Text(controller.items[index].body)),

                                Divider(thickness: 2,color: Colors.grey,height: 1,)
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

}