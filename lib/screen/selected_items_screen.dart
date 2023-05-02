import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:flutter_tchnical_test/model/api_data_model.dart';

class SelectedItemScreen extends StatelessWidget {
   late List<SubSymptom> selectedItems;
   SelectedItemScreen({Key? key, required this.selectedItems}) : super(key: key);


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
            child: ListView.separated(
              separatorBuilder: (context,i)=>Divider(thickness: 1,color: Colors.grey.shade300,indent: 30,endIndent: 30,height: 0.5.h,),
                shrinkWrap: true,
                itemCount: selectedItems.length,
                itemBuilder: (context,index){
                  selectedItems=selectedItems.toSet().toList();
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pinkAccent,
                        border: Border.all(
                            color: Colors.pink, width: 1)),
                    child: Image.network(
                      selectedItems[index].icon,
                      height: 25,
                      color: Colors.white60,
                    ),
                  ),
                  title: Text(selectedItems[index].title),
                ),
              );
            }),
          )
        ],
      ),
    ));
  }
}
