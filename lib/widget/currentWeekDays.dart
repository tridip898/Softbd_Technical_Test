import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CurrentMonthDates extends StatefulWidget {
  const CurrentMonthDates({Key? key}) : super(key: key);

  @override
  State<CurrentMonthDates> createState() => _CurrentMonthDatesState();
}

class _CurrentMonthDatesState extends State<CurrentMonthDates> {
  late DateTime selectedDate;

  @override
  void initState() {
    selectedDate=DateTime.now();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    return SizedBox(
      height: 10.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: daysInMonth,
        itemBuilder: (BuildContext context, int index) {
          DateTime date = firstDayOfMonth.add(Duration(days: index));
          bool isCurrentDay = date.day == now.day;
          bool isSelectedDay = date.day == selectedDate.day;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.2.w,vertical: 1.5.h),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = date;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE').format(date),
                    style: TextStyle(fontSize: 10.sp,color: Colors.grey),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelectedDay ? Colors.pinkAccent : Colors.transparent,
                    ),
                    child: Text(
                      DateFormat('d').format(date),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: isSelectedDay?Colors.white:Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
