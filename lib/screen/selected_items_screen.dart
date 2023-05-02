import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class SelectedItemScreen extends StatelessWidget {
  const SelectedItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                            spreadRadius: 05)
                      ]),
                  child: IconButton(onPressed: (){
                    Get.back();
                  }, icon: const Icon(Icons.arrow_back_ios,color: Colors.pinkAccent,size: 20,))
                ),
                Text(
                  "Selected Items",
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
                const Icon(
                  Icons.info,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,index){
              return ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pinkAccent,
                      border: Border.all(
                          color: Colors.pink, width: 1)),
                  child: Image.asset(
                    'lib/asset/sad.png',
                    height: 25,
                    color: Colors.white60,
                  ),
                ),
                title: Text("Title"),
              );
            }),
          )
        ],
      ),
    ));
  }
}
