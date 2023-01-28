import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeze/data/question.dart';
import 'package:freeze/models/color.dart';
import 'package:freeze/models/font.dart';
import 'package:freeze/models/img.dart';
import 'package:freeze/screens/question/how.dart';
import 'package:freeze/utilities/utility.dart';

WhatList _items = new WhatList();

class What extends StatefulWidget {
  const What({Key key}) : super(key: key);

  @override
  _WhatState createState() => _WhatState();
}

class _WhatState extends State<What> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
            ),
            Container(
              child: Image.asset(
                ImgLocale.IconShackHand,
                height: 48,
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              child: Text(
                '무엇을 찍고 싶으신가요?',
                style: TextStyle(
                    fontFamily: "NotoSans_Bold",
                    fontSize: 20,
                    color: fromHex(GrayScale.Black),
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              child: Text(
                '중복선택도 가능해요!',
                style: TextStyle(
                    fontFamily: "NotoSans_Light",
                    fontSize: 12,
                    color: fromHex(Signiture.PrimaryLight),
                    decoration: TextDecoration.underline,
                    decorationColor: fromHex(Signiture.PrimaryLight),
                    decorationThickness: 2),
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          height: 88,
                          width: 148,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.items[0]['selected'] ? 3 : 2,
                              color: _items.items[0]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.items[0]['selected'] =
                                    !_items.items[0]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.items[0]["title"]}',
                              style: TextStyle(
                                fontFamily: "NotoSans_Bold",
                                fontSize: 14,
                                color: fromHex(Signiture.PrimaryNormal),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          height: 88,
                          width: 148,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.items[1]['selected'] ? 3 : 2,
                              color: _items.items[1]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.items[1]['selected'] =
                                    !_items.items[1]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.items[1]["title"]}',
                              style: TextStyle(
                                fontFamily: "NotoSans_Bold",
                                fontSize: 14,
                                color: fromHex(Signiture.PrimaryNormal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50, right: 50),
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          height: 88,
                          width: 148,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.items[2]['selected'] ? 3 : 2,
                              color: _items.items[2]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.items[2]['selected'] =
                                    !_items.items[2]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.items[2]["title"]}',
                              style: TextStyle(
                                fontFamily: "NotoSans_Bold",
                                fontSize: 14,
                                color: fromHex(Signiture.PrimaryNormal),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          height: 88,
                          width: 148,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.items[3]['selected'] ? 3 : 2,
                              color: _items.items[3]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.items[3]['selected'] =
                                    !_items.items[3]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.items[3]["title"]}',
                              style: TextStyle(
                                fontFamily: "NotoSans_Bold",
                                fontSize: 14,
                                color: fromHex(Signiture.PrimaryNormal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 80,
                  ),
                ],
              ),
            ),
            Container(height: 20),
            Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                  color: fromHex(Signiture.PrimaryNormal),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => How()));
                },
                child: Text(
                  '다음',
                  style: TextStyle(
                    fontFamily: "NotoSans_Medium",
                    fontSize: 12,
                    color: fromHex(GrayScale.White),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
