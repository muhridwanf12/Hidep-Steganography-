import 'package:flutter/material.dart';
import 'package:hidep/decode.dart';
import 'package:hidep/encode.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BUTA CODERS HIDEP",
          style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 24, 110),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpg'),
            const SizedBox(height: 30),
            const SizedBox(
              width: 400,
              child: Center(
                  child: Text(
                "Welcome to HIDEP",
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              )),
            ),
            const SizedBox(height: 8),
            const SizedBox(
              width: 300,
              child: Center(
                  child: Text(
                "Let's Hide Your PDF",
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Encode()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          // side: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text("Encode", style: TextStyle(color: Color.fromARGB(255, 30, 29, 29))),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Decode()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          // side: const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text("Decode", style: TextStyle(color: Color.fromARGB(255, 30, 29, 29))),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color.fromARGB(255, 18, 24, 110), // warna latar belakang footer
        child: SizedBox(
          height: 50.0, // tinggi footer
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '© 2024 ButaCoders.',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
