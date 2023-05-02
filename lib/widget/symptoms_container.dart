import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SymptomsContainer extends StatelessWidget {
  final String image;
  final String text;
  const SymptomsContainer({Key? key, required this.image, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 20
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(image,height: 18,),
          ),
          SizedBox(width: 3.w,),
          SizedBox(
              width: 25.w,
              child: Text(text,style: TextStyle(fontSize: 11.sp,color: Colors.grey.shade500),))
        ],
      ),
    );
  }
}
