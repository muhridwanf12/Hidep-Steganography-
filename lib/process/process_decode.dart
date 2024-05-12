import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:steganograph/steganograph.dart';

decode(String fileImage) async {
  // proses decode
  final embeddedFile = await Steganograph.decodeFile(
    image: File(fileImage),
  );
  if (embeddedFile != null){
    // Dapatkan path dari direktori yang dipilih oleh pengguna
    String? result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      // Jika pengguna memilih folder, simpan pdf yang telah didecode di folder tersebut
      String outputPath = '$result/decoded.pdf';
      await embeddedFile.copy(outputPath);
    }
    return;
  }else{
    return "There is no PDF in this image";
  }
}
