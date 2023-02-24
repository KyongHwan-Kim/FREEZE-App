import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TextGuide extends StatefulWidget {
  const TextGuide({Key? key}) : super(key: key);

  @override
  _TextGuideState createState() => _TextGuideState();
}

class _TextGuideState extends State<TextGuide> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 460,
      ),
      Stack(
        children: [
          Container(
            height: 30,
            color: Colors.black.withOpacity(0.5),
          ),
          Container(
            height: 30,
            child: Container(
                child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontFamily: 'NotoSansKR_Medium',
              ),
              child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                RotateAnimatedText('1. 머리를 가운데 격자의 중앙에,'),
                RotateAnimatedText('발끝을 가운데 아래 격자의 중앙에 맞춰주세요.'),
                RotateAnimatedText('2. 한쪽 다리를 앞으로 빼 주시면'),
                RotateAnimatedText('훨씬 다리가 길어 보여요.'),
                RotateAnimatedText('3. 시선이나 표정이 어색하실 때에는'),
                RotateAnimatedText('먼 쪽을 보시거나 휴대폰을 보셔도 좋아요.'),
                RotateAnimatedText('4. 위에서 내리쬐는 조명이 아닌,'),
                RotateAnimatedText('옆에서 비추는 조명이 잘 나와요.'),
                RotateAnimatedText('5. 무작정 앉지 마시고, 선 상태에서 찍어 주세요.'),
              ]),
            )),
          ),
        ],
      )
    ]);
  }
}
