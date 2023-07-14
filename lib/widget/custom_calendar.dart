import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:simple_todo/constant/color_palette.dart' as palette;

class CustomCalendar extends StatefulWidget {
  final DateTime focusedDay;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;
  final bool Function(DateTime day)? selectedDayPredicate;
  final List<bool> Function(DateTime day)? eventLoader;

  const CustomCalendar({
    Key? key,
    required this.focusedDay,
    required this.onDaySelected,
    required this.selectedDayPredicate,
    required this.eventLoader,
  }) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: null,
        builder: (context, snapshot) {
          return TableCalendar(
            locale: 'ko_KR',
            focusedDay: widget.focusedDay,
            firstDay: DateTime(1945),
            lastDay: DateTime(2200),
            eventLoader: widget.eventLoader,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Colors.grey,
                size: 25,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: Colors.grey,
                size: 25,
              ),
            ),
            rowHeight: 56,
            onDaySelected: widget.onDaySelected,
            selectedDayPredicate: widget.selectedDayPredicate,
            calendarStyle: const CalendarStyle(
              cellMargin: EdgeInsets.all(10.5),
              isTodayHighlighted: true,
              todayDecoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: palette.color1,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              markerMargin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 6),
              markerSize: 5,
              markersMaxCount: 3,
            ),
          );
        });
  }
}
