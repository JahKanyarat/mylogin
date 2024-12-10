import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerController extends GetxController{
  final  ImagePicker picker = ImagePicker();


  Future<String> pickImage()async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image!=null) {
      return image.path;
    }
    else{
      return "";
    }
  }
}