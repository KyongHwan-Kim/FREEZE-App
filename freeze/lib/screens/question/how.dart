import 'package:flutter/material.dart';
import 'package:freeze/data/question.dart';
import 'package:freeze/models/color.dart';
import 'package:freeze/models/img.dart';
import 'package:freeze/screens/app.dart';
import 'package:freeze/utilities/utility.dart';

HowList _items = new HowList();

class How extends StatefulWidget {
  const How({Key key}) : super(key: key);

  @override
  _HowState createState() => _HowState();
}

class _HowState extends State<How> {
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
                ImgLocale.IconCamera,
                height: 48,
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              child: Text(
                '어떻게 찍고 싶으신가요?',
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
                    fontFamily: "NotoSans_Medium",
                    fontSize: 12,
                    color: fromHex(Signiture.PrimaryLight),
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                '# 원하시는 사진 종류를 알려주세요',
                style: TextStyle(
                  fontFamily: "NotoSans_Light",
                  fontSize: 12,
                  color: fromHex(GrayScale.C_BF),
                  decoration: TextDecoration.none,
                ),
              ),
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width:
                                  _items.categoryItems[0]['selected'] ? 3 : 2,
                              color: _items.categoryItems[0]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.categoryItems[0]['selected'] =
                                    !_items.categoryItems[0]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.categoryItems[0]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width:
                                  _items.categoryItems[1]['selected'] ? 3 : 2,
                              color: _items.categoryItems[1]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.categoryItems[1]['selected'] =
                                    !_items.categoryItems[1]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.categoryItems[1]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width:
                                  _items.categoryItems[2]['selected'] ? 3 : 2,
                              color: _items.categoryItems[2]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.categoryItems[2]['selected'] =
                                    !_items.categoryItems[2]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.categoryItems[2]["title"]}',
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width:
                                  _items.categoryItems[3]['selected'] ? 3 : 2,
                              color: _items.categoryItems[3]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.categoryItems[3]['selected'] =
                                    !_items.categoryItems[3]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.categoryItems[3]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width:
                                  _items.categoryItems[4]['selected'] ? 3 : 2,
                              color: _items.categoryItems[4]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.categoryItems[4]['selected'] =
                                    !_items.categoryItems[4]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.categoryItems[4]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width:
                                  _items.categoryItems[5]['selected'] ? 3 : 2,
                              color: _items.categoryItems[5]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.categoryItems[5]['selected'] =
                                    !_items.categoryItems[5]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.categoryItems[5]["title"]}',
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
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      '# 원하시는 사진의 분위기를 알려주세요',
                      style: TextStyle(
                        fontFamily: "NotoSans_Light",
                        fontSize: 12,
                        color: fromHex(GrayScale.C_BF),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.moodItems[0]['selected'] ? 3 : 2,
                              color: _items.moodItems[0]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.moodItems[0]['selected'] =
                                    !_items.moodItems[0]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.moodItems[0]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.moodItems[1]['selected'] ? 3 : 2,
                              color: _items.moodItems[1]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.moodItems[1]['selected'] =
                                    !_items.moodItems[1]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.moodItems[1]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.moodItems[2]['selected'] ? 3 : 2,
                              color: _items.moodItems[2]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.moodItems[2]['selected'] =
                                    !_items.moodItems[2]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.moodItems[2]["title"]}',
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.moodItems[3]['selected'] ? 3 : 2,
                              color: _items.moodItems[3]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.moodItems[3]['selected'] =
                                    !_items.moodItems[3]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.moodItems[3]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.moodItems[4]['selected'] ? 3 : 2,
                              color: _items.moodItems[4]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.moodItems[4]['selected'] =
                                    !_items.moodItems[4]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.moodItems[4]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.moodItems[5]['selected'] ? 3 : 2,
                              color: _items.moodItems[5]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.moodItems[5]['selected'] =
                                    !_items.moodItems[5]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.moodItems[5]["title"]}',
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.moodItems[6]['selected'] ? 3 : 2,
                              color: _items.moodItems[6]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.moodItems[6]['selected'] =
                                    !_items.moodItems[6]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.moodItems[6]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.moodItems[7]['selected'] ? 3 : 2,
                              color: _items.moodItems[7]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.moodItems[7]['selected'] =
                                    !_items.moodItems[7]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.moodItems[7]["title"]}',
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
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: fromHex(GrayScale.White),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: _items.moodItems[8]['selected'] ? 3 : 2,
                              color: _items.moodItems[8]['selected']
                                  ? fromHex(Signiture.PrimaryNormal)
                                  : fromHex(GrayScale.C_BF),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _items.moodItems[8]['selected'] =
                                    !_items.moodItems[8]['selected'];
                              });
                            },
                            child: Text(
                              '${_items.moodItems[8]["title"]}',
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
                    height: 10,
                  ),
                  Container(
                    height: 80,
                  ),
                ],
              ),
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                      color: fromHex(GrayScale.White),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: fromHex(Signiture.PrimaryNormal),
                      )),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => App()));
                    },
                    child: Text(
                      '건너뛰기',
                      style: TextStyle(
                        fontFamily: "NotoSans_Medium",
                        fontSize: 12,
                        color: fromHex(Signiture.PrimaryNormal),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                      color: fromHex(Signiture.PrimaryNormal),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => App()));
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(
                        fontFamily: "NotoSans_Medium",
                        fontSize: 12,
                        color: fromHex(GrayScale.White),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
