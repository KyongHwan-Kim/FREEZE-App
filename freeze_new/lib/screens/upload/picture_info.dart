import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeze_new/data/question.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/models/font.dart';
import 'package:freeze_new/models/img.dart';
import 'package:freeze_new/screens/question/how.dart';
import 'package:freeze_new/utilities/utility.dart';

TagList items = new TagList();

class PictureInfo extends StatefulWidget {
  const PictureInfo({Key? key, required this.picturePath}) : super(key: key);
  final String picturePath;
  @override
  _PictureInfoState createState() => _PictureInfoState();
}

class _PictureInfoState extends State<PictureInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: FileImage(File(widget.picturePath)),
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              child: Text(
                '잠깐! 사진 태그를 해주세요',
                style: TextStyle(
                    fontFamily: "NotoSans_Bold",
                    fontSize: 20,
                    color: fromHex(GrayScale.Black),
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              child: Text(
                '해당 태그를 원하는 이용자에게 먼저 노출돼요!',
                style: TextStyle(
                    fontFamily: "NotoSans_Light",
                    fontSize: 10,
                    color: fromHex(Signiture.PrimaryLight),
                    decoration: TextDecoration.underline,
                    decorationColor: fromHex(Signiture.PrimaryLight),
                    decorationThickness: 2),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.items.length,
                    itemBuilder: ((context, index) => Container(
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                ),
                                Text(
                                  '${items.items[index]['tagName']}',
                                  style: TextStyle(
                                    fontFamily: "NotoSans_Light",
                                    fontSize: 12,
                                    color: fromHex(GrayScale.C_BF),
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
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
                                        width: items.items[index]['tag'][0]
                                                ['selected']
                                            ? 3
                                            : 2,
                                        color: items.items[index]['tag'][0]
                                                ['selected']
                                            ? fromHex(Signiture.PrimaryNormal)
                                            : fromHex(GrayScale.C_BF),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          items.items[index]['tag'][0]
                                                  ['selected'] =
                                              !items.items[index]['tag'][0]
                                                  ['selected'];
                                        });
                                      },
                                      child: Text(
                                        '${items.items[index]['tag'][0]["title"]}',
                                        style: TextStyle(
                                          fontFamily: "NotoSans_Bold",
                                          fontSize: 14,
                                          color:
                                              fromHex(Signiture.PrimaryNormal),
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
                                        width: items.items[index]['tag'][1]
                                                ['selected']
                                            ? 3
                                            : 2,
                                        color: items.items[index]['tag'][1]
                                                ['selected']
                                            ? fromHex(Signiture.PrimaryNormal)
                                            : fromHex(GrayScale.C_BF),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          items.items[index]['tag'][1]
                                                  ['selected'] =
                                              !items.items[index]['tag'][1]
                                                  ['selected'];
                                        });
                                      },
                                      child: Text(
                                        '${items.items[index]['tag'][1]["title"]}',
                                        style: TextStyle(
                                          fontFamily: "NotoSans_Bold",
                                          fontSize: 14,
                                          color:
                                              fromHex(Signiture.PrimaryNormal),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        )))),
            Container(
              height: 20,
            ),
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
            Container(
              height: 20,
            ),
          ]),
    );
  }
}
