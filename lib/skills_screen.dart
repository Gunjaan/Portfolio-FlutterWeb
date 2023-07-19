import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for tech skills and languages
    List<String> techSkills = [
      'Flutter Development',
      'Data Science',
      'Data Structures and Algorithms',
      'Data Analysis',
      'Data Visualisation',
      'Machine Learning',
      'OpenCV',
      'Git/Github',
      'Graphic Designing',
      'UI/UX designing',
      'Technical Content Writing'
    ];

    List<String> languages = [
      'Python',
      'C++',
      'C',
      'R',
      "HTML",
      "CSS",
      'Dart',
    ];

    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: const Text(
          'SKILLS',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(
            255, 74, 40, 111), // Set app bar color to purple (lavender shade)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Technical Skills',
                        style: TextStyle(
                          color: Colors
                              .white, // Set text color to white for contrast
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10, // Space between cards
                        children: techSkills
                            .map((skill) => _buildSkillCard(skill))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    width: 20), // Space between tech skills and languages
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Languages',
                        style: TextStyle(
                          color: Colors
                              .white, // Set text color to white for contrast
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10, // Space between cards
                        children: languages
                            .map((language) => _buildSkillCard(language))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCard(String skill) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          skill,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
