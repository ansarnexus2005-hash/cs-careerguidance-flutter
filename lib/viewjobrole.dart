import 'package:flutter/material.dart';

class Job {
  final String companyName;
  final String role;
  final String experience;
  final String salary;
  final String description;

  Job({
    required this.companyName,
    required this.role,
    required this.experience,
    required this.salary,
    required this.description,
  });
}

class JobRolesListPage extends StatelessWidget {
  JobRolesListPage({Key? key}) : super(key: key);

  final List<Job> jobs = [
    Job(
      companyName: 'Google',
      role: 'Software Engineer',
      experience: '2 years',
      salary: '\$120,000',
      description: 'Work on AI and machine learning systems.',
    ),
    Job(
      companyName: 'Microsoft',
      role: 'Frontend Developer',
      experience: '3 years',
      salary: '\$100,000',
      description: 'Build user interfaces with Flutter and React.',
    ),
    Job(
      companyName: 'Amazon',
      role: 'Backend Developer',
      experience: '4 years',
      salary: '\$110,000',
      description: 'Design scalable APIs and microservices.',
    ),
  ];

  void _applyToJob(BuildContext context, String role, String company) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Applied to $role at $company'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Job Roles'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.business, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Text(
                        job.companyName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.work_outline, size: 20, color: Colors.black54),
                      const SizedBox(width: 6),
                      Text('Role: ${job.role}', style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 20, color: Colors.black54),
                      const SizedBox(width: 6),
                      Text('Experience: ${job.experience}', style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.attach_money, size: 20, color: Colors.black54),
                      const SizedBox(width: 6),
                      Text('Salary: ${job.salary}', style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Job Description:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    job.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: () => _applyToJob(context, job.role, job.companyName),
                      child: const Text('Apply', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
