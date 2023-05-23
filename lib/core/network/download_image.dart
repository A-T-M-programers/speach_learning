import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speach_learning/core/services/services_locator.dart';

class DownloadImage extends Equatable {
  final String url;

  const DownloadImage(this.url);

  Future<File> downloadFileImage() async {
    //comment out the next two lines to prevent the device from getting
    // the image from the web in order to prove that the picture is
    // coming from the device instead of the web.
    var documentDirectory = await getApplicationDocumentsDirectory();
    var firstPath = documentDirectory.path + "/images";
    var filePathAndName = documentDirectory.path + '/images/avatar.jpg';
    //comment out the next three lines to prevent the image from being saved
    //to the device to show that it's coming from the internet
    await Directory(firstPath).create(recursive: true);
    File file2 = File(filePathAndName);
    var response = await sl<Dio>(instanceName: "Dio").download(url,filePathAndName);
    return file2;
  }

  @override
  List<Object> get props => [url];
}