

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class get_photo {

  static File path = File("");
  // // ignore: non_constant_identifier_names
  // Future<String> Upload(File imageFile) async {
  //   if (Validation.isValidnull(imageFile.path)) {
  //     var secret = Crypt.sha256("put_photo");
  //     Uri url = Uri(
  //         host: host,
  //         path: 'Mailing_API/put_image.php',
  //         scheme: scheme);
  //     var response = await http.post(url, body: {
  //       'image': base64Encode(imageFile.readAsBytesSync()),
  //       'name': imageFile.path
  //           .split("/")
  //           .last,
  //       'secret': '$secret'
  //     });
  //     int status = response.statusCode;
  //     switch (status) {
  //       case 200:
  //         {
  //           showtoast("Image Uploaded Successfully.");
  //           return scheme + '://' + host + '/' + 'Mailing_API/Image_File/' +
  //               imageFile.path
  //                   .split("/")
  //                   .last;
  //         }
  //       case 403:
  //         {
  //           showtoast("Image Uploaded Not Successfully.");
  //           return "";
  //         }
  //       case 101:
  //         {
  //           showtoast("Image Uploaded Is Exist in server");
  //           return "";
  //         }
  //       default:
  //         {
  //           showtoast(response.reasonPhrase!);
  //           return "";
  //         }
  //     }
  //   }
  //   return "";
  // }

  /// Get from gallery
  static Future<File> _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return File("");
    }
  }


  /// Get from camera
  static Future<File> _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return File("");
    }
  }

  static showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: const Icon(
                        Icons.photo, color: Colors.lightBlueAccent, size: 70,),
                      onTap: () async {
                        path = await _getFromGallery();
                        Navigator.maybePop(context, 'Ok');
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: const Icon(
                        Icons.camera_alt_rounded, color: Colors.redAccent,
                        size: 70,),
                      onTap: () async {
                        path = await _getFromCamera();
                        Navigator.pop(context, 'Ok');
                      },
                    )
                  ],
                ),
              ));
        });
  }
}