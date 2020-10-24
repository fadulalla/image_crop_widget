// Copyright 2019 Florian Bauer. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:image_crop_widget/src/image_crop_controller.dart';

import 'crop_area.dart';

class CropAreaTouchHandler {
  final CropArea _cropArea;
  ImageCropController _controller;
  Offset _activeAreaDelta;
  CropActionArea _activeArea;

  CropAreaTouchHandler({@required CropArea cropArea, ImageCropController controller})
      : _cropArea = cropArea,
        _controller = controller;

  void startTouch(Offset touchPosition) {
    _activeArea = _cropArea.getActionArea(touchPosition);
    _activeAreaDelta = _cropArea.getActionAreaDelta(touchPosition, _activeArea);
  }

  void updateTouch(Offset touchPosition) {
    final Rect initialArea = _cropArea.cropRect;
    _cropArea.move(touchPosition, _activeAreaDelta, _activeArea);
    _controller?.notifyListeners(initialArea, _cropArea.cropRect);
  }

  void endTouch() {
    _activeArea = null;
    _activeAreaDelta = null;
  }
}
