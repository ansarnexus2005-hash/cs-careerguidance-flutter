import 'package:flutter/material.dart';

class College {
  final String name;
  final List<String> courses;

  College({required this.name, required this.courses});
}

class CollegeFilterPage extends StatefulWidget {
  const CollegeFilterPage({super.key});

  @override
  _CollegeFilterPageState createState() => _CollegeFilterPageState();
}

class _CollegeFilterPageState extends State<CollegeFilterPage> {
  final List<College> colleges = [
    College(name: "Harvard University", courses: ["Computer Science", "Law", "Business"]),
    College(name: "MIT", courses: ["Engineering", "Computer Science", "Mathematics"]),
    College(name: "Stanford University", courses: ["Business", "Engineering", "Law"]),
    College(name: "Oxford University", courses: ["Philosophy", "Law", "Computer Science"]),
  ];

  String? selectedCourse;

  List<String> get allCourses {
    final courseSet = <String>{};
    for (var college in colleges) {
      courseSet.addAll(college.courses);
    }
    final coursesList = courseSet.toList();
    coursesList.sort();
    return coursesList;
  }

  List<College> get filteredColleges {
    if (selectedCourse == null || selectedCourse!.isEmpty) return colleges;
    return colleges
        .where((college) => college.courses.contains(selectedCourse))
        .toList();
  }

  void clearFilter() {
    setState(() {
      selectedCourse = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Colleges by Course"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Select a course",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.school),
              ),
              value: selectedCourse,
              items: allCourses
                  .map((course) => DropdownMenuItem(
                        value: course,
                        child: Text(course),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),
            const SizedBox(height: 12),
            if (selectedCourse != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: clearFilter,
                  icon: const Icon(Icons.clear),
                  label: const Text("Clear Filter"),
                ),
              ),
            const SizedBox(height: 12),
            Expanded(
              child: filteredColleges.isEmpty
                  ? const Center(
                      child: Text(
                        "No colleges found for the selected course.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredColleges.length,
                      itemBuilder: (context, index) {
                        final college = filteredColleges[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(college.name),
                            subtitle: Text(college.courses.join(", ")),
                            leading: const Icon(Icons.school, color: Colors.blueGrey),
                          ),
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
