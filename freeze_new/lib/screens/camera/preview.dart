import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/models/font.dart';
import 'package:freeze_new/utilities/utility.dart';
import 'package:http/http.dart' as http;
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
  List file = [];
  String directory = "";
  // Make New Function
  void _listofFiles() async {
    directory = (await pPath.getApplicationDocumentsDirectory()).path;

    setState(() {
      file = Directory("$directory/picture")
          .listSync(); //use your folder name insted of resume.
    });
    print(file);
  }

  @override
  void initState() {
    super.initState();
    _listofFiles();
  }

  @override
  Widget build(BuildContext context) {
    // Future getImage(ImageSource context) async {
    //   final pickedFile = await picker.platform.pickImage(source: context);
    //   return picker.getImage(source: context).then((value) {
    //     setState(() {
    //       _image = File(value!.path);
    //     });
    //   });
    // }

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
              onPressed: () async {
                var headers = {'Content-Type': 'multipart/form-data'};
                var request = http.MultipartRequest(
                    'POST',
                    Uri.parse(
                        'http://ec2-43-201-76-102.ap-northeast-2.compute.amazonaws.com:8080/image'));
                request.files.add(await http.MultipartFile.fromPath(
                    'user_file', widget.picture.path));
                request.headers.addAll(headers);

                http.StreamedResponse response = await request.send();

                if (response.statusCode == 200) {
                  print(await response.stream.bytesToString());
                } else {
                  print(response.reasonPhrase);
                }
              }),
        ],
      ),
      body: Stack(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.file(
            File(widget.picture.path),
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
                  child: ListView(controller: sc, children: [
                    Image.asset(
                      "assets/images/Box_Image.png",
                      width: MediaQuery.of(context).size.width - 40,
                    ),
                  ]),
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
