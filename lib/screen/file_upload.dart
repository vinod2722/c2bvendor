import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MaterialApp(
    home: FileUploadScreen(),
  ));
}

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  List<PlatformFile>? _selectedFiles = [];

  Future<void> _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _selectedFiles = result.files;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Text('Select Files'),
            ),
            SizedBox(height: 20),
            Text('Selected Files:'),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedFiles?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_selectedFiles![index].name),
                    subtitle: Text(
                        '${(_selectedFiles![index].size / 1024).toStringAsFixed(2)} KB'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
