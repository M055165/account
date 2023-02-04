import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_calendar/constant/button.dart';
import 'package:my_calendar/globals.dart';

List containerList = [
  Container(
    width: double.infinity,
    height: 200,
    color: Colors.white,
    child: Column(
      children: [
        Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
          child: Column(
            children: [
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoTextButton(
                      alignment: Alignment.centerLeft,
                      text: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: kPaddingM),
                        child: Text(
                          '全部期間',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      onTap: () => print('eddie'),
                    ),
                    CupertinoIconButton(
                      icon: const Icon(CupertinoIcons.list_bullet,
                          color: Colors.grey),
                      onTap: () => print('eddie123'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Column(
                      children: const [
                        Text(
                          '-\$89,668',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        Text('淨資產',
                            style: TextStyle(fontSize: 16, color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text(
                    '-\$89,668',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  Text('淨資產',
                      style: TextStyle(fontSize: 16, color: Colors.grey))
                ],
              ),
              Column(
                children: const [
                  Text(
                    '-\$89,668',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  Text('淨資產',
                      style: TextStyle(fontSize: 16, color: Colors.grey))
                ],
              ),
              Column(
                children: const [
                  Text(
                    '-\$89,668',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  Text('淨資產',
                      style: TextStyle(fontSize: 16, color: Colors.grey))
                ],
              )
            ],
          ),
        ),
      ],
    ),
  ),
  Container(
    width: double.infinity,
    height: 200,
    color: Colors.white,
    child: Column(
      children: [
        Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
          child: Column(
            children: [
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoTextButton(
                      alignment: Alignment.centerLeft,
                      text: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: kPaddingM),
                        child: Text(
                          '全部期間',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      onTap: () => print('eddie'),
                    ),
                    CupertinoIconButton(
                      icon: const Icon(CupertinoIcons.list_bullet,
                          color: Colors.grey),
                      onTap: () => print('eddie123'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Column(
                      children: const [
                        Text(
                          '-\$89,668',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        Text('淨資產',
                            style: TextStyle(fontSize: 16, color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text(
                    '-\$89,668',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  Text('淨資產',
                      style: TextStyle(fontSize: 16, color: Colors.grey))
                ],
              ),
              Column(
                children: const [
                  Text(
                    '-\$89,668',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  Text('淨資產',
                      style: TextStyle(fontSize: 16, color: Colors.grey))
                ],
              ),
              Column(
                children: const [
                  Text(
                    '-\$89,668',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  Text('淨資產',
                      style: TextStyle(fontSize: 16, color: Colors.grey))
                ],
              )
            ],
          ),
        ),
      ],
    ),
  ),
];

class AccountAnalysis extends StatelessWidget {
  const AccountAnalysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.yellow,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return containerList[index];
            },
            itemCount: 2,
            pagination: SwiperPagination(),
          ),
        ),
      ],
    );
  }
}
