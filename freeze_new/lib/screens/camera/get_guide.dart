import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freeze_new/data/sample.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/screens/camera/freeze_camera.dart';
import 'package:freeze_new/utilities/utility.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';

class GetGuide extends StatefulWidget {
  const GetGuide({Key? key}) : super(key: key);

  @override
  _GetGuideState createState() => _GetGuideState();
}

List<CameraDescription> _cameras = <CameraDescription>[];

class _GetGuideState extends State<GetGuide> {
  List<Map> imgList = ImgSample().items;
  List<Map> filterList = [];
  Map? selectGuide;
  String directory = "";
  String selectImgPath = "";
  String filter = "Recommend";

  @override
  void initState() {
    super.initState();
    imgList.forEach((element) {
      if (element["category"] == "Recommend") {
        filterList.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: fromHex(GrayScale.White),
        toolbarHeight: 70,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: fromHex(GrayScale.Black),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          '가이드 선택',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: fromHex(GrayScale.Black),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.navigate_next_sharp,
                size: 35,
                color: fromHex(Signiture.PrimaryNormal),
              ),
              onPressed: () async {
                WidgetsFlutterBinding.ensureInitialized();
                _cameras = await CameraPlatform.instance.availableCameras();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FreezeCamera(
                            cameras: _cameras, guide: selectGuide)));
              }),
        ],
      ),
      body: Stack(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              selectGuide == null
                  ? Container(
                      height: 250,
                      child: Text("가이드를 선택해주세요"),
                    )
                  : Image.asset(
                      selectGuide!['originAsset'],
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height - 320,
                      width: MediaQuery.of(context).size.width - 20,
                    ),
            ],
          )
        ]),
        SlidingUpPanel(
          isDraggable: true,
          parallaxEnabled: true,
          parallaxOffset: .5,
          minHeight: MediaQuery.of(context).size.height - 650,
          panelBuilder: (sc) => MediaQuery.removePadding(
              context: context,
              // removeTop: true,
              child: Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: GridView.builder(
                    itemCount: filterList.length, //item 개수
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                      childAspectRatio: 1 / 1, //item 의 가로 1, 세로 2 의 비율
                      mainAxisSpacing: 10, //수평 Padding
                      crossAxisSpacing: 10, //수직 Padding
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      //item 의 반목문 항목 형성
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              filterList.forEach((element) {
                                element['selected'] = false;
                              });
                              filterList[index]['selected'] =
                                  !filterList[index]['selected'];
                              if (!filterList[index]['selected'])
                                selectGuide = null;
                              else {
                                selectGuide = filterList[index];
                              }
                            });
                          },
                          // Image tapped
                          child: filterList[index]['selected']
                              ? Container(
                                  width: 90.0,
                                  height: 90.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    filterList[index]["originAsset"],
                                    fit: BoxFit.cover, // Fixes border issues
                                  ),
                                )
                              : Container(
                                  width: 90.0,
                                  height: 90.0,
                                  child: Image.asset(
                                    filterList[index]["originAsset"],
                                    fit: BoxFit.cover, // Fixes border issues
                                  ),
                                ));
                    },
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 70.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18.0),
                                  topRight: Radius.circular(18.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 10,
                              ),
                              Container(
                                width: 30,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                              ),
                              Container(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: filter == 'Recommend'
                                            ? fromHex(Signiture.PrimaryNormal)
                                            : fromHex(GrayScale.White),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 2,
                                          color:
                                              fromHex(Signiture.PrimaryNormal),
                                        )),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          filter = 'Recommend';
                                          filterList = [];
                                          imgList.forEach((element) {
                                            if (element["category"] ==
                                                "Recommend") {
                                              filterList.add(element);
                                            }
                                          });
                                          print(imgList);
                                        });
                                      },
                                      child: Text(
                                        '추천',
                                        style: TextStyle(
                                          fontFamily: "Montserrat_Extrabold",
                                          fontSize: 10,
                                          color: filter == 'Recommend'
                                              ? fromHex(GrayScale.White)
                                              : fromHex(
                                                  Signiture.PrimaryNormal),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: filter == 'Popular'
                                            ? fromHex(Signiture.PrimaryNormal)
                                            : fromHex(GrayScale.White),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 2,
                                          color:
                                              fromHex(Signiture.PrimaryNormal),
                                        )),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          filter = 'Popular';
                                          filterList = [];
                                          imgList.forEach((element) {
                                            if (element["category"] ==
                                                "Popular") {
                                              filterList.add(element);
                                            }
                                          });
                                        });
                                      },
                                      child: Text(
                                        '인기',
                                        style: TextStyle(
                                          fontFamily: "Montserrat_Extrabold",
                                          fontSize: 10,
                                          color: filter == 'Popular'
                                              ? fromHex(GrayScale.White)
                                              : fromHex(
                                                  Signiture.PrimaryNormal),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: filter == 'Save_list'
                                            ? fromHex(Signiture.PrimaryNormal)
                                            : fromHex(GrayScale.White),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 2,
                                          color:
                                              fromHex(Signiture.PrimaryNormal),
                                        )),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          filter = 'Save_list';
                                          filterList = [];
                                          imgList.forEach((element) {
                                            if (element["category"] ==
                                                "Save_list") {
                                              filterList.add(element);
                                            }
                                          });
                                        });
                                      },
                                      child: Text(
                                        '저장 목록',
                                        style: TextStyle(
                                          fontFamily: "Montserrat_Extrabold",
                                          fontSize: 10,
                                          color: filter == 'Save_list'
                                              ? fromHex(GrayScale.White)
                                              : fromHex(
                                                  Signiture.PrimaryNormal),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ])),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        ),
      ]),
    );
  }
}
