enum ImagePickerTypes {
  gallery,
  camera
}

class ImagePickerTypeEnums {
  // ImagePicker input type
  static const gallery = 'gallery';
  static const camera = 'camera';

  static ImagePickerTypes getTypes(String input) {
    switch (input) {
      case gallery:
        return ImagePickerTypes.gallery;
      case camera:
        return ImagePickerTypes.camera;
      default:
        return ImagePickerTypes.gallery;
    }
  }
}