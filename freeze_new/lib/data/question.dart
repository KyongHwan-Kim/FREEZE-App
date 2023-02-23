class WhatList {
  List<Map> items = [
    {'title': '인물사진', 'value': 'portrait', 'selected': false},
    {'title': '풍경사진', 'value': 'landscape', 'selected': false},
    {'title': '실내', 'value': 'indoor', 'selected': false},
    {'title': '실외', 'value': 'outdoor', 'selected': false},
  ];
}

class HowList {
  List<Map> categoryItems = [
    {'title': '전신사진', 'value': 'fullShot', 'selected': false},
    {'title': '셀카', 'value': 'selfie', 'selected': false},
    {'title': '거울샷', 'value': 'mirrorShot', 'selected': false},
    {'title': '상반신샷', 'value': 'upperBodyShot', 'selected': false},
    {'title': '커플사진', 'value': 'coupleShot', 'selected': false},
    {'title': '인증샷', 'value': 'certificationShot', 'selected': false},
  ];
  List<Map> moodItems = [
    {'title': '밝은', 'value': 'bright', 'selected': false},
    {'title': '네추럴한', 'value': 'natural', 'selected': false},
    {'title': '다채로운', 'value': 'different', 'selected': false},
    {'title': '무채색', 'value': 'greyScale', 'selected': false},
    {'title': '감각적인', 'value': 'sensitive', 'selected': false},
    {'title': '쾌활한', 'value': 'active', 'selected': false},
    {'title': '건강한', 'value': 'healthy', 'selected': false},
    {'title': '시크한', 'value': 'cool', 'selected': false},
    {'title': '어두운', 'value': 'dark', 'selected': false},
  ];
}

class CameraRouteList {
  List<Map> items = [
    {'title': '프리즈 촬영', 'value': 'freeze', 'selected': false},
    {'title': '혼자 촬영', 'value': 'self', 'selected': false},
    {'title': '사진 편집', 'value': 'edit', 'selected': false},
  ];
}

class TagList {
  List<Map> items = [
    {
      'tagName': '# 찍은 사진의 종류를 알려주세요',
      'tag': [
        {'title': '인물사진', 'value': 'person', 'selected': false},
        {'title': '풍경사진', 'value': 'background', 'selected': false}
      ]
    },
    {
      'tagName': '# 사진을 찍은 위치를 알려주세요',
      'tag': [
        {'title': '실내', 'value': 'person', 'selected': false},
        {'title': '실외', 'value': 'background', 'selected': false}
      ]
    },
    {
      'tagName': '# 사진 속 계절을 알려주세요',
      'tag': [
        {'title': '봄', 'value': 'person', 'selected': false},
        {'title': '여름', 'value': 'person', 'selected': false},
        {'title': '가을', 'value': 'person', 'selected': false},
        {'title': '겨울', 'value': 'background', 'selected': false}
      ]
    },
  ];
}
