import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Preview extends StatelessWidget {
  const Preview({Key? key, required this.picture}) : super(key: key);
  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(picture.name),
          const SizedBox(height: 24),
          IconButton(
            icon: Icon(Icons.upload_file),
            color: Colors.black,
            iconSize: 30.0,
            onPressed: () async {
              var headers = {'Content-Type': 'multipart/form-data'};
              var request = http.MultipartRequest(
                  'POST',
                  Uri.parse(
                      'http://ec2-43-201-76-102.ap-northeast-2.compute.amazonaws.com:8080/image'));
              request.files.add(
                  await http.MultipartFile.fromPath('user_file', picture.path));
              request.headers.addAll(headers);

              http.StreamedResponse response = await request.send();

              if (response.statusCode == 200) {
                print(await response.stream.bytesToString());
              } else {
                print(response.reasonPhrase);
              }
            },
          ),
        ]),
      ),
    );
  }
}
