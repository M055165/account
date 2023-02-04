import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_calendar/globals.dart';

import '../../constant/button.dart';

class PanelAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PanelAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 30,
            color: Colors.red,
          ),
          Container(
            width: 50,
            height: 30,
            color: Colors.blue,
          ),
        ],
      ),
      leading: Row(mainAxisSize: MainAxisSize.min, children: [
        CupertinoIconButton(
          icon: const Icon(
            CupertinoIcons.add,
            color: Colors.white,
          ),
          onTap: () => print('eddie'),
        ),
        CupertinoIconButton(
          icon: const Icon(
            CupertinoIcons.add,
            color: Colors.white,
          ),
          onTap: () => print('eddie'),
        ),
        // Icon(Icons.add)
      ]),
      leadingWidth: 80,
      actions: [
        Icon(Icons.add),
        Icon(
          Icons.add,
          color: Colors.white,
        )
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolBarHeightS + kPaddingM * 2 + 0);
}
