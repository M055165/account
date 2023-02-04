import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:my_calendar/globals.dart';
import 'package:my_calendar/widgets/common/app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class One extends StatefulWidget {
  const One({Key? key}) : super(key: key);
  static const routeName = '/one';

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  final Map<DateTime, List> _holidays = {
    DateTime(2021, 3, 1): ["228"],
  };
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PanelAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              locale: 'zh_CN',
              daysOfWeekVisible: true,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
            Column(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(kPaddingM),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('支出: 500'),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            boxShadow: const [],
                          )),
                      onTap: () {
                        print('點擊');
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(kPaddingM),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('支出: 500'),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            boxShadow: const [],
                          )),
                      onTap: () {
                        print('點擊');
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(kPaddingM),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('支出: 500'),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            boxShadow: const [],
                          )),
                      onTap: () {
                        print('點擊');
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
