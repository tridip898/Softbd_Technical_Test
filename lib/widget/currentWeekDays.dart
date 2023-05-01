import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CurrentWeekDatesWidget extends StatelessWidget {
  const CurrentWeekDatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<Widget> days = [];

    DateTime startOfWeek = now.subtract(Duration(days: now.weekday));
    DateTime endOfWeek = now.add(Duration(days: 7 - now.weekday));

    for (DateTime date = startOfWeek; date.isBefore(endOfWeek); date = date.add(const Duration(days: 1))) {
      String formattedDate = DateFormat('dd').format(date);
      String formattedDay = DateFormat('EEE').format(date);

      days.add(
        Column(
          children: [
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: 1.5.h,),
            Text(
              formattedDay,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days,
    );
  }
}
