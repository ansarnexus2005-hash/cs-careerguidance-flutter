import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Uploadmarklist extends StatefulWidget {
   Uploadmarklist({super.key});

  @override
  State<Uploadmarklist> createState() => _UploadmarklistState();
}

class _UploadmarklistState extends State<Uploadmarklist> {
  String? fileName;

  bool ShowSuggestions = false;

  final List<Map<String, dynamic>> suggestions = [
    {
      "skills": ["python","Machine Learning","Data Analysis"],
      "jobs": ["Data Anayst","ML Engineer","AI Researcher"],
      "salary":"4,00,000 - 8,00,000 per year"
    },
    {
      "skills": ["c Programming","Embedded Systems", "IoT"],
      "jobs":["Embedded Systems","IoT Developer","Hardware Engineer"],
      "salary":"3,50,000 - 7,00,000 per year"
    },
  ];

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
    
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,title: Text("Upload Marklist"),centerTitle: true,),
      body: Column(
      children: [
        ElevatedButton.icon(
          onPressed: pickfile,
          icon: const Icon(Icons.upload_file),
          label: const Text("Uploadmarklist"),
        ),
        const SizedBox(height: 20),
        if(fileName != null) Text("upload: $fileName"),
        const SizedBox(height: 20),

        if(ShowSuggestions)
          Expanded(
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder:(context,index) {
                final item=suggestions[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Recommended Skills:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Text(item["skills"].join(", ")),
                      const SizedBox(height: 8),
                      Text("Suggested Jobs:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Text(item["jobs"].join(", ")),
                      const SizedBox(height: 8),
                      Text("salary Range:",
                          style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 16)),
                      Text(item["salary"]),
                    ], 
                  ),
                   );
  }))]) );}}