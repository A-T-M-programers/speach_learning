import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/core/services/services_locator.dart';

// ignore: must_be_immutable
class EditPhotoPage extends StatefulWidget {


  const EditPhotoPage({super.key, required this.image});
  final XFile image;

  @override
  State<EditPhotoPage> createState() => _editPhotoPageState();


}
// ignore: camel_case_types
class _editPhotoPageState extends State<EditPhotoPage>{
  @override
  Widget build(BuildContext context) {
    return Container();
  }


  @override
  void initState() {
    super.initState();
    _cropImage();
  }

  Future<void> _cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: widget.image.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        cropStyle: CropStyle.circle,
        uiSettings:[ AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blue,
            hideBottomControls: false,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            cropGridColumnCount: 2,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )]);

    if (croppedFile != null) {
      context.read<ProfileParticipantBloc>().add(SetPhotoParticipantEvent(photoPath: croppedFile.path,id: sl<Participants>().id));
      Navigator.pop(context);
    }

  }
}