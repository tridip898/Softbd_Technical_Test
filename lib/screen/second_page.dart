import 'package:flutter_tchnical_test/controller/api_controller.dart';
import 'package:flutter_tchnical_test/screen/selected_items_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:flutter_tchnical_test/model/api_data_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  DateTime day = DateTime.now();

  Set<SubSymptom> _selectedItems = {};

  final _apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: FutureBuilder<ApiDataModel>(
          future: _apiController.fetchDatas,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///appbar
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

                  ///api data
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data.symptoms.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w, top: 1.h),
                                  child: Text(
                                    snapshot.data!.data.symptoms[index].title,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(
                                        snapshot.data!.data.symptoms[index]
                                            .subSymptom.length, (subIndex) {
                                      final item = SubSymptom(
                                          id: snapshot.data!.data.symptoms[index].subSymptom[subIndex]
                                              .id,
                                          icon: snapshot.data!.data.symptoms[index].subSymptom[subIndex].icon,
                                          title: snapshot.data!.data.symptoms[index].subSymptom[subIndex].title);
                                      return GestureDetector(
                                        onTap: () {
                                          Get.defaultDialog(
                                            title: "",
                                              content: Text(
                                                "ARE YOU SURE TO WANT TO SELECT THIS?",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white),
                                              ),
                                              backgroundColor:
                                                  Colors.pinkAccent.shade100,
                                              onCancel: () {
                                                Get.back();
                                              },
                                              textCancel: "NO",
                                              cancelTextColor: Colors.white,
                                              onConfirm: () {
                                                snapshot.data!.data.symptoms[index].subSymptom[subIndex].isSelected = true;
                                                _selectedItems.add(item);
                                                Get.back();
                                              },
                                              textConfirm: "YES",
                                              confirmTextColor: Colors.white,
                                              barrierDismissible: true,
                                              buttonColor:
                                                  Colors.pinkAccent.shade100);

                                          // selectedItems = myDataList!.where((item) => item.data.symptoms[index].subSymptom[subIndex].isSelected).toList();
                                          // snapshot
                                          //     .data!
                                          //     .data
                                          //     .symptoms[index]
                                          //     .subSymptom[subIndex]
                                          //     .isSelected = true;
                                          // setState(() {
                                          //   _selectedItems.add(item);
                                          // });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 1.h),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(7),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: snapshot
                                                            .data!
                                                            .data
                                                            .symptoms[index]
                                                            .subSymptom[
                                                                subIndex]
                                                            .isSelected
                                                        ? Colors.pinkAccent
                                                        : Colors.grey.shade100,
                                                    border: Border.all(
                                                        color: Colors.pink,
                                                        width: 1)),
                                                child: Image.network(
                                                  snapshot
                                                      .data!
                                                      .data
                                                      .symptoms[index]
                                                      .subSymptom[subIndex]
                                                      .icon,
                                                  height: 25,
                                                  color: snapshot
                                                          .data!
                                                          .data
                                                          .symptoms[index]
                                                          .subSymptom[subIndex]
                                                          .isSelected
                                                      ? Colors.white60
                                                      : Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                                child: Text(
                                                  snapshot
                                                      .data!
                                                      .data
                                                      .symptoms[index]
                                                      .subSymptom[subIndex]
                                                      .title,
                                                  style: TextStyle(
                                                      fontSize: 9.sp,
                                                      color:
                                                          Colors.grey.shade500),
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
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SelectedItemScreen(
                      selectedItems: _selectedItems.toList(),
                    )));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            margin: EdgeInsets.only(bottom: 1.h),
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
      ),
    );
  }
}
