import 'package:flutter/material.dart';

class EdgeGuide extends StatefulWidget {
  const EdgeGuide({Key? key}) : super(key: key);

  @override
  _EdgeGuideState createState() => _EdgeGuideState();
}

class _EdgeGuideState extends State<EdgeGuide> {
  @override
  Widget build(BuildContext context) {
    //  Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.2,
//                                 decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(24)),
//                                     color: Colors.white),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     isEdgeGuideOn
//                                         ? Slider(
//                                             value: edgeGuideOpacity,
//                                             min: 0,
//                                             max: 1,
//                                             // divisions: 5,
//                                             label: "label",
//                                             onChanged: (newValue) {
//                                               if (mounted) {
//                                                 setState(
//                                                   () {
//                                                     edgeGuideOpacity = newValue;
//                                                   },
//                                                 );
//                                               }
//                                             },
//                                           )
//                                         : Container(
//                                             height: 48,
//                                           ),
//                                     Container(
//                                       height: 20,
//                                     ),

//                                   ],
//                                 ))
    return Container();
  }
}
