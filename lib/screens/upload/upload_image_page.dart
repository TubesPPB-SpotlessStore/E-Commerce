import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class UploadImagePage extends StatefulWidget {
  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? _selectedFile;

  Future<void> _pickImageFromFilePicker() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      // Handle any errors here
    }
  }

  Future<void> _uploadImage() async {
    // Implement logic to upload image to the server
    if (_selectedFile != null) {
      // Example: Upload logic (replace with your actual implementation)
      try {
        // Simulate upload process
        await Future.delayed(Duration(seconds: 2));
        // Show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image uploaded successfully!'),
          ),
        );
      } catch (e) {
        print('Error uploading image: $e');
        // Handle any upload errors here
      }
    } else {
      // No image selected, handle accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No image selected.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _selectedFile == null
                ? Text('No image selected.')
                : Image.file(
                    _selectedFile!,
                    height: 100,
                    width: 100,
                  ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImageFromFilePicker,
              child: Text('Pick Image'),
            ),
            if (_selectedFile != null) ...[
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text('Upload Image'),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
              child: Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}
