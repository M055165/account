import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_calendar/globals.dart';

import '../../constant/button.dart';

class AccountAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: const Text(
          '帳戶',
          style: TextStyle(color: Colors.white),
        ),
      ),
      leading: Row(children: [
        CupertinoTextButton(
          alignment: Alignment.centerLeft,
          text: const Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingM),
            child: Text(
              '編輯',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => print('eddie'),
        ),
        CupertinoTextButton(
          alignment: Alignment.centerLeft,
          text: const Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingM),
            child: Text(
              '轉帳',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => print('eddie'),
        ),
      ]),
      leadingWidth: 120,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CupertinoIconButton(
            icon: const Icon(
              CupertinoIcons.ellipsis,
              color: Colors.white,
            ),
            onTap: () => print('eddie'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CupertinoIconButton(
            icon: const Icon(
              CupertinoIcons.creditcard,
              color: Colors.white,
            ),
            onTap: () => print('eddie'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolBarHeightS + kPaddingM * 2 + 0);
}
