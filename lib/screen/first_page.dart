import 'package:flutter/material.dart';
import 'package:flutter_tchnical_test/widget/currentWeekDays.dart';
import 'package:flutter_tchnical_test/widget/explore_category.dart';
import 'package:flutter_tchnical_test/widget/symptoms_container.dart';
import 'package:sizer/sizer.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List catData = [
    ['Cycle', 'lib/asset/Icon.png'],
    ['My Health', 'lib/asset/Group 3178.png'],
    ['Shop', 'lib/asset/Icon_basket.png'],
  ];

  int _selectedIndex = 0;
  int _index=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 4.w, right: 4.w, top: 2.h, bottom: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'lib/asset/Group 3173.png',
                        height: 20,
                      ),
                      Image.asset(
                        'lib/asset/Icon-1.png',
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: SizedBox(
                    height: 15.h,
                    child: ListView.builder(
                        itemCount: catData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          bool isSelected = _selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Container(
                              height: 14.h,
                              width: 27.w,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                  color:
                                      isSelected ? Colors.pink : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    catData[index][1],
                                    height: 26,
                                    color:
                                        isSelected ? Colors.white : Colors.pink,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    catData[index][0],
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200, blurRadius: 15)
                              ]),
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: const CurrentMonthDates(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.all(50),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade500, width: 1),
                                shape: BoxShape.circle),
                            child: Column(
                              children: [
                                Text(
                                  'Title',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  '1st Day',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.pink.shade300),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 5),
                          child: Text(
                            'Drink Herbal Tea For Cramps',
                            style: TextStyle(
                                fontSize: 10.sp, color: Colors.pink.shade300),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Image.asset(
                    'lib/asset/Siliders.png',
                    height: 6,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  child: Row(
                    children: [
                      const Expanded(
                        child: SymptomsContainer(
                            image: 'lib/asset/plus.png',
                            text: 'Enter your symptoms'),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Expanded(
                        child: SymptomsContainer(
                            image: 'lib/asset/Icon3.png',
                            text: 'Log your symptoms'),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Explore",
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: const [
                      Expanded(
                        child: ExploreCategory(text: 'Category 1'),
                      ),
                      Expanded(
                        child: ExploreCategory(text: 'Category 2'),
                      ),
                      Expanded(
                        child: ExploreCategory(text: 'Category 3'),
                      ),
                      Expanded(
                        child: ExploreCategory(text: 'Category 4'),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 16.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/asset/WhatsApp Image -1.png'),
                          fit: BoxFit.fill)),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Demo App',
                        style: TextStyle(fontSize: 16.sp, color: Colors.purple),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 8.h,
                        child: Text(
                          "Free unlimited consultations with our panel doctor Up to 15% home diagnostic sample collection 15000 discount on health and life insurance",
                          style: TextStyle(
                              fontSize: 10.sp, color: Colors.grey.shade500),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 13.h,
                            width: 50.w,
                            child: Image.asset(
                              'lib/asset/Group 2131.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  "Unlock Premium",
                  style: TextStyle(fontSize: 16.sp, color: Colors.pinkAccent),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 15.h,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '30-day Free Trial',
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  '(Then BDT 3456.00/year\nonly BDT 234,00/month)',
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 9.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 15.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '1 month BDT 234.00',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 4.w, top: 3.h),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add My Partner',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.purple,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 16.h,
                            width: 75.w,
                            child: Image.asset(
                              'lib/asset/Group 3183.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade400,
          selectedItemColor: Colors.pink.shade300,
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          currentIndex: _index,
          onTap: (i){
            setState(() {
              _index=i;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('lib/asset/Icon4.png')),label: ""),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('lib/asset/Group 3184.png')),label: ""),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('lib/asset/Group 3185.png')),label: ""),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage('lib/asset/Send.png')),label: ""),
          ],
        )
      ),
    );
  }
}
