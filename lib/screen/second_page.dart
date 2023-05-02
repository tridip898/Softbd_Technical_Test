import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tchnical_test/model/api_data_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  DateTime day = DateTime.now();
  Future<ApiDataModel>? fetchDatas;

  Future<ApiDataModel> fetchData() async {
    final response =
        await http.get(Uri.parse('https://api.npoint.io/30bd2c680d812dd23df1'));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      return ApiDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDatas = fetchData();
  }

  void showCustomDialog(BuildContext context) {
     showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.pink.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 15.h,
              width: 60.w,
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      'ARE YOU SURE YOU WANT TO SELECT THIS',
                      style: TextStyle(fontSize: 10.sp, color: Colors.white),
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade300,
                          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                      ),
                      SizedBox(width: 4.w,),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.shade300,
                            padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                        child: const Text(
                          'No',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: (){
            Get.toNamed('/detail');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            width: 80.w,
            decoration: BoxDecoration(
                color: Colors.pink.shade300,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'lib/asset/Polygon 1.png',
                    height: 20,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  'VIEW ALL SELECTED ITEMS',
                  style: TextStyle(fontSize: 11.sp, color: Colors.white60),
                )
              ],
            ),
          ),
        ),
        body: FutureBuilder<ApiDataModel>(
          future: fetchDatas,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Column(
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
                                    color: Colors.grey.shade400,
                                    blurRadius: 10,
                                    spreadRadius: 05)
                              ]),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'lib/asset/Polygon 9.png',
                            height: 20,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM').format(day),
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                        itemCount: snapshot.data!.data.symptoms.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w,top: 1.h),
                                  child: Text(
                                    snapshot.data!.data.symptoms[index].title,
                                    style: TextStyle(
                                        fontSize: 12.sp, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(snapshot.data!.data.symptoms[index].subSymptom.length, (subIndex){
                                      return GestureDetector(
                                        onTap: (){
                                          snapshot.data!.data.symptoms[index].subSymptom[subIndex].isSelected=true;
                                          setState(() {

                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 1.h),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(7),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: snapshot.data!.data.symptoms[index].subSymptom[subIndex].isSelected ? Colors.pinkAccent:Colors.grey.shade100,
                                                    border: Border.all(
                                                        color: Colors.pink, width: 1)),
                                                child: Image.network(
                                                  snapshot.data!.data.symptoms[index]
                                                      .subSymptom[subIndex].icon,
                                                  height: 25,
                                                  color: snapshot.data!.data.symptoms[index].subSymptom[subIndex].isSelected ? Colors.white60:Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(height: 2,),
                                              SizedBox(
                                                width: 20.w,
                                                child: Text(
                                                  snapshot.data!.data.symptoms[index]
                                                      .subSymptom[subIndex].title,
                                                  style: TextStyle(
                                                      fontSize: 9.sp,
                                                      color: Colors.grey.shade500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                )

                              ],
                            ),
                          );

                        }),
                  )
                ],
              );
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
