import 'dart:ui';

class ImageCropController {
  ImageCropController({this.onCropAreaChanged});
  VoidCallback onCropAreaChanged;

  void notifyListeners(Rect sourceArea, Rect targetArea) {
    if (onCropAreaChanged == null || sourceArea == null || targetArea == null) return;
    bool isSame = sourceArea.top == targetArea.top;
    isSame &= sourceArea.right == targetArea.right;
    isSame &= sourceArea.bottom == targetArea.bottom;
    isSame &= sourceArea.left == targetArea.left;
    if (isSame) return;
    onCropAreaChanged.call();
  }
}
