// import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hidep/process/process_encode.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:stegano_app/process/process_encode.dart';
// import 'package:steganograph/steganograph.dart';

// import 'process/process_encode.dart';

class Encode extends StatefulWidget {
  const Encode({super.key});

  @override
  State<Encode> createState() => _EncodeState();
}

class _EncodeState extends State<Encode> {
  File? pickedImage;
  File? pickedPdf;
  String? result;
  // File? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encode',
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 18, 24, 110),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            // img
            const SizedBox(
                height: 30,
                width: 330,
                child: Text(
                  "Please upload the cover image here",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromARGB(255, 125, 124, 124)),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pickedImage == null
                    ? Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
                        child: const Center(
                          child: Text(
                            'No images uploaded',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )
                    : Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
                        child: Center(
                          child: Text(
                            pickedImage!.path.split('/').last,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),

                // *tombol upload img
                SizedBox(
                  width: 140,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? picked = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['png'],
                      );
                      if (picked != null) {
                        setState(() {});
                        pickedImage = File(picked.files.single.path!);
                        setState(() {});
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.grey[300]!),
                      )),
                    ),
                    child: const Text('Upload Image'),
                  ),
                ),
              ],
            ),

            // *Tampilkan gambar yang dipilih di bawah Row
            SizedBox(height: pickedImage != null ? 30 : 0),
            SizedBox(
              child: pickedImage != null
                  ? SizedBox(
                      width: 300,
                      height: 200,
                      child: Image.file(
                        pickedImage!,
                        fit: BoxFit.cover,
                      ))
                  : Container(),
            ),

            const SizedBox(height: 30),

            //*pdf
            const SizedBox(
                height: 30,
                width: 330,
                child: Text(
                  "Please upload the PDF file here",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Color.fromARGB(255, 125, 124, 124)),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pickedPdf == null
                    ? Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: const Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'No PDF files uploaded',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )

                    // nama pdf
                    : Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30, left: 30),
                            child: Text(
                              pickedPdf!.path.split('/').last,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 10),

                // tombol upload pdf
                SizedBox(
                  width: 140,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: pickedImage != null
                        ? () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf'],
                            );
                            if (result != null) {
                              setState(() {});
                              pickedPdf = File(result.files.single.path!);
                            }
                          }
                        : null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.grey[300]!),
                      )),
                    ),
                    child: const Text('Upload PDF'),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),

            //*tombol unduh hasil encode
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: pickedPdf != null
                  ? () async {
                      result = await encode(pickedPdf!.path, pickedImage!.path);
                      setState(() {});
                    }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                "Encode and Download",
              ),
            ),
            const SizedBox(height: 20,),

            result == null ? const Text(''):
            Text(result.toString()),
           


          ],
        ),
      ),
    );
  }
}
