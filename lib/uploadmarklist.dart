import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadMarklist extends StatefulWidget {
  const UploadMarklist({super.key});

  @override
  State<UploadMarklist> createState() => _UploadMarklistState();
}

class _UploadMarklistState extends State<UploadMarklist> {
  String? fileName;

  bool showSuggestions = false;

  final List<Map<String, dynamic>> suggestions = [
    {
      "skills": ["Python", "Machine Learning", "Data Analysis"],
      "jobs": ["Data Analyst", "ML Engineer", "AI Researcher"],
      "salary": "4,00,000 - 8,00,000 per year",
    },
    {
      "skills": ["C Programming", "Embedded Systems", "IoT"],
      "jobs": ["Embedded Systems Engineer", "IoT Developer", "Hardware Engineer"],
      "salary": "3,50,000 - 7,00,000 per year",
    },
  ];

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
        showSuggestions = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Marklist"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: pickFile,
                icon: const Icon(Icons.upload_file),
                label: const Text("Upload Marklist"),
              ),
              const SizedBox(height: 20),
              if (fileName != null)
                Text(
                  "Uploaded: $fileName",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              const SizedBox(height: 20),
              if (showSuggestions)
                Expanded(
                  child: ListView.builder(
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      final item = suggestions[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Recommended Skills:",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(item["skills"].join(", ")),
                              const SizedBox(height: 12),
                              const Text(
                                "Suggested Jobs:",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(item["jobs"].join(", ")),
                              const SizedBox(height: 12),
                              const Text(
                                "Salary Range:",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(item["salary"]),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
