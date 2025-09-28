import 'package:flutter/material.dart';

class College {
  final String name;
  final List<String> courses;

  College({required this.name, required this.courses});
}

class CollegeFilterPage extends StatefulWidget {
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
    return courseSet.toList();
  }

  List<College> get filteredColleges {
    if (selectedCourse == null) return colleges;
    return colleges
        .where((college) => college.courses.contains(selectedCourse))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Colleges by Course"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              hint: Text("Select a course"),
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredColleges.length,
              itemBuilder: (context, index) {
                final college = filteredColleges[index];
                return ListTile(
                  title: Text(college.name),
                  subtitle: Text(college.courses.join(", ")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
