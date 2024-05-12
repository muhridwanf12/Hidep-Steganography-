// import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:steganograph/steganograph.dart';

encode(String filePDF, String fileImage) async {
  // Lakukan encoding file gambar ke dalam file PDF
  File? encodedFile = await Steganograph.encodeFile(
    image: File(fileImage),
    fileToEmbed: File(filePDF),
  );
  if (encodedFile != null){
    String? result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      String outputPath = '$result/encoded_image.png';
      await encodedFile.copy(outputPath);
    }
    return;
  }else{
    return 'Image cover is too small! Try to change image cover or PDF';
  }
}
