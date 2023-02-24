import 'package:flutter/material.dart';

class GridGuide extends StatefulWidget {
  const GridGuide({Key? key, required this.ratio}) : super(key: key);
  final double ratio;
  @override
  _GridGuideState createState() => _GridGuideState();
}

class _GridGuideState extends State<GridGuide> {
  bool _isGridGuideOn = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: widget.ratio,
          child: Image.asset(
            'assets/images/Grid.png',
            fit: BoxFit.fill,
            opacity: AlwaysStoppedAnimation(0.4),
          ),
        ),
        IconButton(
          icon: Icon(Icons.question_mark),
          color: Colors.white,
          iconSize: 24.0,
          onPressed: () {
            if (mounted) {
              setState(() {
                _isGridGuideOn = true;
              });
            }
          },
        ),
        if (_isGridGuideOn)
          AspectRatio(
            aspectRatio: widget.ratio,
            child: Image.asset(
              'assets/images/Guide_Grid.png',
              fit: BoxFit.fill,
              opacity: AlwaysStoppedAnimation(1),
            ),
          ),
        if (_isGridGuideOn)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.cancel_outlined),
                color: Colors.white,
                iconSize: 24.0,
                onPressed: () {
                  if (mounted) {
                    setState(() {
                      _isGridGuideOn = false;
                    });
                  }
                },
              ),
            ],
          ),
      ],
    );
  }
}
