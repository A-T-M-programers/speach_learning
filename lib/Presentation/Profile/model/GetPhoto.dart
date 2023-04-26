
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speach_learning/Presentation/Profile/component/edit_photo.dart';

// ignore: camel_case_types
class get_photo {
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

  /// Get Image
  static Future _getImage(ImageSource imageSource,BuildContext context) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      Navigator.push(context, MaterialPageRoute(builder: (route)=> EditPhotoPage(image:XFile(pickedFile.path))));
    } else {

    }
  }

  static showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?",style: TextStyle(color: Theme.of(context).textTheme.headline2!.color),),
              content: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      child: const Icon(
                        Icons.photo, color: Colors.lightBlueAccent, size: 70,),
                      onTap: () async {
                        await _getImage(ImageSource.gallery,context);
                        // Navigator.pop(context, 'Ok');
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: const Icon(
                        Icons.camera_alt_rounded, color: Colors.redAccent,
                        size: 70,),
                      onTap: () async {
                        await _getImage(ImageSource.camera,context);
                        // Navigator.pop(context, 'Ok');
                      },
                    )
                  ],
                ),
              ));
        });
  }
}