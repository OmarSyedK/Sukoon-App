import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class MomentsScreen extends StatefulWidget {
  const MomentsScreen({Key? key}) : super(key: key);

  @override
  _MomentsScreenState createState() => _MomentsScreenState();
}

class _MomentsScreenState extends State<MomentsScreen> {
  Map<String, Memory> memories = {};

  Future<void> _pickImage(String label, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      File? croppedImage = await _cropImage(File(pickedFile.path));

      if (croppedImage != null) {
        DateTime? selectedDate = await _selectDate(context);

        if (selectedDate != null) {
          setState(() {
            memories[label] = Memory(image: croppedImage, date: selectedDate);
          });
        }
      }
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moments'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMemoryButton(context, 'I\'m home!'),
          _buildMemoryButton(context, 'First smile'),
          _buildMemoryButton(context, 'First feed'),
          _buildMemoryButton(context, 'Sleeping'),
          _buildMemoryButton(context, 'Bath time'),
          _buildMemoryButton(context, 'Going outside'),
          _buildMemoryButton(context, 'First Laugh'),
          _buildMemoryButton(context, 'Found my hands'),
          _buildMemoryButton(context, 'Lift my head'),
          _buildMemoryButton(context, 'In the park'),
          _buildMemoryButton(context, 'First hug'),
          _buildMemoryButton(context, 'First solids'),
        ],
      ),
    );
  }

  Widget _buildMemoryButton(BuildContext context, String label) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SafeArea(
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: const Text('Choose from Gallery'),
                        onTap: () {
                          _pickImage(label, ImageSource.gallery);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.camera_alt),
                        title: const Text('Take a Photo'),
                        onTap: () {
                          _pickImage(label, ImageSource.camera);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16.0),
            backgroundColor: Colors.lightBlue[100],
          ),
          child: memories.containsKey(label)
              ? CircleAvatar(
                  backgroundImage: FileImage(memories[label]!.image),
                  radius: 30,
                )
              : const Icon(Icons.add, color: Colors.blue, size: 30),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class Memory {
  Memory({required this.image, required this.date});

  final File image;
  final DateTime date;
}
