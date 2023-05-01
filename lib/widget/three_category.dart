import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ThreeCategory extends StatelessWidget {
  final String image;
  final String text;
  const ThreeCategory({Key? key, required this.image, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      width: 28.w,
      margin: EdgeInsets.only(right: 4.w),
      decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,height: 26,color: Colors.amber,),
          SizedBox(height: 2.h,),
          Text(text,style: TextStyle(fontSize: 12.sp,color: Colors.white),)
        ],
      ),
    );
  }
}
