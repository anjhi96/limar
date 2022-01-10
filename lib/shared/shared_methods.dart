part of 'shared.dart';


Future<File> getPicture() async {
  var picture = await ImagePicker.pickImage(source: ImageSource.camera);
  return picture;
}