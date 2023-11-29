import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class ImageHelperService extends BaseViewModel {
  ImagePicker imagePicker = ImagePicker();
  ImageCropper imageCropper = ImageCropper();

  pickImage({
    ImageSource source = ImageSource.camera,
    int imageQuality = 100,
  }) async {
    return await imagePicker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );
  }

  Future<CroppedFile?> crop({
    required XFile file,
    CropStyle cropStyle = CropStyle.rectangle,
  }) async =>
      await imageCropper.cropImage(
        sourcePath: file.path,
        cropStyle: cropStyle,
        compressQuality: 100,
        uiSettings: [AndroidUiSettings(), IOSUiSettings()],
      );
}
