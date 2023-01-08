import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    XFile? pickedXFile;

    if (Platform.isAndroid) {
      pickedXFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600,
      );
    }

    if (Platform.isIOS) {
      pickedXFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 600,
      );
    }

    if (pickedXFile == null) {
      return;
    }

    final imageFile = File(pickedXFile.path);

    setState(() {
      _storedImage = imageFile;
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);

    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1), color: Colors.grey),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(_storedImage as File,
                  fit: BoxFit.cover, width: double.infinity)
              : const Text('No Image Taken', textAlign: TextAlign.center),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera),
            label: Text(
              'Take Picture',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}
