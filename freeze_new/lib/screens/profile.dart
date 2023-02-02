import 'package:flutter/material.dart';
import 'package:freeze_new/widgets/map/map.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: SingleChildScrollView(
    //       //to scroll images
    //       //TODO
    //       child: Image.asset("assets/images/contents.png")),
    // );
    return Container(child: Map());
  }
}
