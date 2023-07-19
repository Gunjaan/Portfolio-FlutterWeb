import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Project> projects = [
      Project(
        title: 'ChaiLens',
        description:
            'ChaiLens is an openCV based project that uses technology to make ordering chai more fun and interactive. It works by analyzing how customers move, and then lets them choose what they want in their chai. This makes ordering chai easier and more fun!',
        imageAsset: 'chailens.png',
        // Image asset for Project 4
      ),
      Project(
        title: 'ExpenseMate',
        description:
            'ExpenseMate is a Flutter application that provides a visual representation of expenses categorized into different buckets. It helps users gain insights into their spending habits by displaying a chart with bars representing each expense category.',
        imageAsset: 'expensemate.png', // Image asset for Project 1
      ),
      Project(
        title: 'CanineVision',
        description:
            'A High-Performance Deep Learning Model that Accurately Identifies Dog Breeds from Images, leveraging Advanced Data Analysis Techniques and TensorFlow.',
        imageAsset: 'caninevision.png', // Image asset for Project 5
      ),
      Project(
        title: 'TechQuizilla',
        description:
            'Techquizilla is a quiz app built using Flutter with a visually appealing and user-friendly UI/UX design. The android/ios app focuses on testing users\' knowledge in the field of technology.',
        imageAsset: 'techquizilla.png', // Image asset for Project 2
      ),

      Project(
        title: 'NeuralSight',
        description:
            'NeuralSight uses deep neural networks to help detect and understand objects in pictures or videos. You can use this project to snap a photo of something or show it what your camera sees, and then NeuralSight will tell you what\'s in the picture and where it is. NeuralSight is a computer program that can recognise objects using pre-trained model, like YOLOv3.',
        imageAsset: 'neuralsight.png', // Image asset for Project 6
      ),
      Project(
        title: 'Words of Grace',
        description:
            '"Words of Grace" is a beautifully designed mobile application built using Flutter, a popular cross-platform framework. This app aims to inspire and uplift users with a collection of motivational quotes sourced from the \'type.fit\' API.',
        imageAsset: 'wordsofgrace.png', // Image asset for Project 3
      ),
      // Add more projects here
    ];

    return Scaffold(
      appBar: AppBar(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Latest Projects',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.0), // Add 5 pixels of space
              Text(
                'All my projects are available at my GitHub.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(
              255, 65, 35, 173) // Set app bar color to purple (lavender shade)
          ),
      backgroundColor: Colors.black, // Set background color to black
      body: GridView.builder(
        padding: const EdgeInsets.all(100.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          Project project = projects[index];
          return _buildProjectCard(project);
        },
      ),
    );
  }

  Widget _buildProjectCard(Project project) {
    return HoverCard(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.asset(
                    project.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    project.description,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            const Spacer(), // Add spacer to push the button to the bottom
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 65, 35, 173),
                ),
              ),
              onPressed: () {
                html.window.open(
                    "https://github.com/Gunjaan?tab=repositories", "Projects");
              },
              child: const Text("Click Here to See"),
            ),
          ],
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String imageAsset;

  Project({
    required this.title,
    required this.description,
    required this.imageAsset,
  });
}

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({super.key, required this.child});

  @override
  // ignore: library_private_types_in_public_api
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _isHovered
              ? const Color.fromARGB(255, 65, 35, 173)
              : const Color.fromARGB(0, 197, 171, 171),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
