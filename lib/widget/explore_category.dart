import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExploreCategory extends StatelessWidget {
  final String text;
  const ExploreCategory({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Container(
            height: 7.h,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            child: Image.asset('lib/asset/Group 3181.png'),
          ),
          const Spacer(),
          Text(text,style: TextStyle(fontSize: 8.sp,color: Colors.grey.shade500),)
        ],
      ),
    );
  }
}
