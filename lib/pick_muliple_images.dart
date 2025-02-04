import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickMulipleImages extends StatefulWidget {
  const PickMulipleImages({super.key});

  @override
  State<PickMulipleImages> createState() => _PickMulipleImagesState();
}

class _PickMulipleImagesState extends State<PickMulipleImages> {
  List<File> images = [];
//Func to upload more than one image
  pickImages() async {
    List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        images.addAll(pickedFiles.map((imgFile) => File(imgFile.path)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Center(child: Text("Images Picker"))),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: images.isEmpty
                    ? Center(
                        child: Text(
                        "No images Here , Press button to upload Images ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        //listview to show images
                        child: ListView.builder(
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                width: 130,
                                height: 130,
                                child: Image.file(
                                  images[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
              ElevatedButton(
                onPressed: pickImages,
                child: Text(
                  "Pick Image",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
