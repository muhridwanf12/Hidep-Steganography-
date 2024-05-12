import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hidep/process/process_decode.dart';
// import 'package:image_picker/image_picker.dart';

class Decode extends StatefulWidget {
  const Decode({super.key});

  @override
  State<Decode> createState() => _DecodeState();
}

class _DecodeState extends State<Decode> {
  File? pickedImage;
  File? pickedPdf;
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Decode',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 18, 24, 110),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            //* img
            const SizedBox(
                height: 30,
                width: 330,
                child: Text(
                  "Please upload the image here",
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
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                        ),
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
                const SizedBox(height: 10),

                //*Tombol upload image
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
                        setState(() {
                          pickedImage = File(picked.files.single.path!);
                        });
                        
                        // setState(() {});
                      }
                      // pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                      // setState(() {});
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
                        File(pickedImage!.path),
                        fit: BoxFit.cover,
                      ))
                  : Container(),
            ),

            const SizedBox(height: 50),
            
            // *Tombol decode
            ElevatedButton(
              onPressed: pickedImage != null
                  ? () async {
                     result = await decode(pickedImage!.path);
                    setState(() {});
                    }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text('Decode and Download'),
            ),

            const SizedBox(height: 10,),
            result == null ?
            const Text(''):
            Text(result.toString())
          ],
        ),
      ),
    );
  }
}
