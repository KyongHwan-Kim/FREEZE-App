// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freeze_new/screens/camera/guide/edge_guide.dart';
import 'package:freeze_new/screens/camera/guide/grid_guide.dart';
import 'package:freeze_new/screens/camera/guide/text_guide.dart';

import 'camera_controller.dart';

/// A widget showing a live camera preview.
class CameraPreview extends StatelessWidget {
  /// Creates a preview widget for the given camera controller.
  const CameraPreview(this.controller, this._isGridOn, this._isEdgeGuideOn,
      this.edgeGuideOpacity, this.guide,
      {Key? key, this.child})
      : super(key: key);

  /// The controller for the camera that the preview is shown for.
  final CameraController controller;

  /// A widget to overlay on top of the camera preview
  final Widget? child;
  final bool? _isGridOn;
  final bool? _isEdgeGuideOn;
  final Map? guide;
  final double gridOpacity = 0.4;
  final double edgeGuideOpacity;
  // final String edgePath = 'assets/images/eric_at_ocean_edge.png';
  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? ValueListenableBuilder<CameraValue>(
            valueListenable: controller,
            builder: (BuildContext context, Object? value, Widget? child) {
              final double cameraAspectRatio =
                  controller.value.previewSize!.width /
                      controller.value.previewSize!.height;
              return AspectRatio(
                aspectRatio: _isLandscape()
                    ? cameraAspectRatio
                    : (1 / cameraAspectRatio),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    _wrapInRotatedBox(child: controller.buildPreview()),
                    child ?? Container(),
                    if (_isGridOn!) GridGuide(ratio: 1 / cameraAspectRatio),
                    if (_isEdgeGuideOn!)
                      EdgeGuide(
                          edgeOpacity: edgeGuideOpacity,
                          edgePath: guide!['edgeAsset']),
                    if (_isEdgeGuideOn!) const TextGuide()
                  ],
                ),
              );
            },
            child: child,
          )
        : Container();
  }

  Widget _wrapInRotatedBox({required Widget child}) {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return child;
    }

    return RotatedBox(
      quarterTurns: _getQuarterTurns(),
      child: child,
    );
  }

  bool _isLandscape() {
    return <DeviceOrientation>[
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ].contains(_getApplicableOrientation());
  }

  int _getQuarterTurns() {
    final Map<DeviceOrientation, int> turns = <DeviceOrientation, int>{
      DeviceOrientation.portraitUp: 0,
      DeviceOrientation.landscapeRight: 1,
      DeviceOrientation.portraitDown: 2,
      DeviceOrientation.landscapeLeft: 3,
    };
    return turns[_getApplicableOrientation()]!;
  }

  DeviceOrientation _getApplicableOrientation() {
    return controller.value.isRecordingVideo
        ? controller.value.recordingOrientation!
        : (controller.value.previewPauseOrientation ??
            controller.value.lockedCaptureOrientation ??
            controller.value.deviceOrientation);
  }
}
