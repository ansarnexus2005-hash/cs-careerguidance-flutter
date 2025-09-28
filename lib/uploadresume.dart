import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Uploadresume extends StatefulWidget {
   Uploadresume({super.key});

  @override
  State<Uploadresume> createState() => _UploadresumeState();
}

class _UploadresumeState extends State<Uploadresume> {
   String? fileName;

  bool ShowSuggestions = false;

        Future<void> pickfile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf','jpg','png'],
    );
    
    if (result !=null) {
      setState((){
        fileName = result.files.single.name;
        ShowSuggestions = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(backgroundColor: Colors.blueGrey,title: Text("Upload Resume "),centerTitle: true,),
      body: Column(
      children: [
        ElevatedButton.icon(
          onPressed: pickfile,
          icon: const Icon(Icons.upload_file),
          label: const Text("uploadresume"),
        ),
   ]) );
  }
}
    
  
