import 'dart:io';

import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/models/font.dart';
import 'package:freeze_new/utilities/utility.dart';
import 'package:freeze_new/screens/upload/picture_info.dart' as imgInfo;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pPath;
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';

class Preview extends StatefulWidget {
  const Preview({Key? key, required this.picture}) : super(key: key);
  final XFile picture;

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  List<FileSystemEntity> file = [];
  List<FileSystemEntity> reversedfile = [];
  String directory = "";
  String selectImgPath = "";
  // Make New Function
  void _listofFiles() async {
    final appDir = await pPath.getExternalStorageDirectory();
    setState(() {
      file = Directory("${appDir?.path}/picture/").listSync();
      reversedfile =
          List.from(file.reversed); //use your folder name insted of resume.
    });
  }

  @override
  void initState() {
    super.initState();
    _listofFiles();
  }

  @override
  Widget build(BuildContext context) {
    String selectImgPath = widget.picture.path;

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
          '새 업로드 항목',
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            imgInfo.PictureInfo(picturePath: selectImgPath)));
              }),
        ],
      ),
      body: Stack(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.file(
            File(selectImgPath),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height - 320,
            width: MediaQuery.of(context).size.width - 20,
          ),
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
                    itemCount: reversedfile.length, //item 개수
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
                            print(selectImgPath);
                            selectImgPath = reversedfile[index].path;
                          });
                        }, // Image tapped
                        child: Image.file(
                          File(reversedfile[index].path),
                          fit: BoxFit.cover, // Fixes border issues
                          width: 90.0,
                          height: 90.0,
                        ),
                      );
                    },
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          height: 50.0,
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
                              Text("업로드할 항목을 선택해주세요",
                                  style: TextStyle(
                                    fontFamily: "NotoSans_Bold",
                                    fontSize: 12,
                                  )),
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
