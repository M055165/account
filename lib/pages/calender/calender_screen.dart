import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_calendar/globals.dart';

import '../../constant/button.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({Key? key}) : super(key: key);
  static const routeName = '/calendar';

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoIconButton(
                  icon: const Icon(CupertinoIcons.gear),
                  onTap: () {
                    print('eddie');
                  }),
              const SizedBox(width: kPaddingM),
              const Text('今天')
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                color: Colors.red,
              ),
              Icon(
                Icons.add,
                color: Colors.red,
              )
            ],
          ),
          middle: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                color: Colors.red,
              ),
              Icon(
                Icons.add,
                color: Colors.red,
              )
            ],
          ),
        ),
        child: Text('eddie'));
  }
}
