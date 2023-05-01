import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  DateTime day=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 10,
                          spreadRadius: 05
                        )
                      ]
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('lib/asset/Polygon 9.png',height: 20,),
                  ),
                  Text(DateFormat('d MMM').format(day),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                  const Icon(Icons.info,color: Colors.grey,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w,top: 1.h),
              child: Text('Head',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.pink,width: 1)
              ),
              child: Image.asset(''),
            )
          ],
        ),
      ),
    );
  }
}
