import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadResume extends StatefulWidget {
  const UploadResume({super.key});

  @override
  State<UploadResume> createState() => _UploadResumeState();
}

class _UploadResumeState extends State<UploadResume> {
  String? fileName;

  bool showSuggestions = false;

  final List<Map<String, dynamic>> suggestions = [
    {
      "skills": ["Flutter", "Dart", "UI/UX"],
      "jobs": ["Flutter Developer", "Mobile Developer", "UI Engineer"],
      "salary": "5,00,000 - 10,00,000 per year",
    },
    {
      "skills": ["Java", "Spring Boot", "Microservices"],
      "jobs": ["Java Developer", "Backend Engineer", "Software Architect"],
      "salary": "6,00,000 - 12,00,000 per year",
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
        title: const Text("Upload Resume"),
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
                label: const Text("Upload Resume"),
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
