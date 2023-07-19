// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:portfolio/projects_screen.dart';
import 'package:portfolio/skills_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primaryColor: Colors.purpleAccent,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 174, 130, 231)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
                const BorderSide(color: Color.fromARGB(255, 105, 58, 130))),
          ),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: AnimatedPadding(
          duration: const Duration(seconds: 1),
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NavHeader(navButtons: buildNavButtons(context)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const ProfileInfo(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const SocialInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 16,
      backgroundColor: Colors.black,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 22, 12, 22),
        children: buildNavButtons(context),
      ),
    );
  }

  List<Widget> buildNavButtons(BuildContext context) => [
        NavButton(
          text: "Projects",
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectsSection()),
            );
          },
        ),
        const SizedBox(width: 20),
        NavButton(
          text: "Skills",
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SkillsScreen()),
            );
          },
        ),
      ];
}

// Rest of the classes remain unchanged.

class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;

  const NavHeader({Key? key, required this.navButtons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: navButtons,
        )
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;

  const NavButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(color),
      ),
      child: Text(text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  profileImage(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 93, 33, 139),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("illust.jpg"),
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
              height: 10), // Add some space between the image and the caption
          Text(
            "Flutter Developer | Data Science Enthusiast",
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  final String description = "flutter developer/data science enthusiast";

  profileData(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Hello,",
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white70, fontSize: 10),
          ),
          const Text(
            "I'm Gunjan Verma.",
            textScaleFactor: 5,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Computer Science Undergrad at JUIT, Solan.\n",
                  style: TextStyle(
                    color: Color.fromARGB(179, 195, 141, 241),
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: "\n",
                ),
                WidgetSpan(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.white70,
                      ),
                      SizedBox(
                          width: 5), // Add some space between the icon and text
                      Text(
                        "From Shimla, Himachal Pradesh, India.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            textScaleFactor: 1.5,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 86, 46, 142)),
                ),
                onPressed: () {
                  html.window.open(
                      "https://drive.google.com/file/d/13xk-R0AJr5MyjeICqSgASw76RYJOVlLw/view",
                      "");
                },
                child: const Text("Download CV"),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 86, 46, 142)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProjectsSection()),
                  );
                },
                child: const Text("See Latest Projects"),
              ),
            ],
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        profileImage(context), // Passing the context to profileImage function
        profileData(context),
      ],
    );
  }
}

class SocialInfo extends StatelessWidget {
  const SocialInfo({super.key});

  List<Widget> socialMediaWidgets() {
    return [
      Tooltip(
        message: 'Gmail',
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: IconButton(
            icon: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjGUt6mPfmPJFGKzLg3ob2rdb8bHk2eUSNyQ&usqp=CAU',
              width: 20, // Adjust the width as needed
              height: 20, // Adjust the height as needed
            ),
            onPressed: () {
              html.window.open("mailto:gunjanverma0133@gmail.com", "Gmail");
            },
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Tooltip(
        message: 'Leetcode',
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: IconButton(
            icon: Image.network(
              'data:image/png;base64,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',
              width: 20, // Adjust the width as needed
              height: 20, // Adjust the height as needed
            ),
            onPressed: () {
              html.window.open("https://leetcode.com/gunjanvermaa", "Git");
            },
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Tooltip(
        message: 'LinkedIn',
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: IconButton(
            icon: Image.network(
              'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAeFBMVEX///8AAACmpqb5+fkgICDl5eXb29tfX19ubm58fHzz8/McHBzq6urNzc38/Pzw8PAPDw/X19c0NDSysrJPT0+srKx2dnYqKirf398VFRU9PT2IiIhGRkbFxcW6urpXV1eZmZllZWUxMTGSkpKWlpaBgYGfn59BQUGXtn/iAAAE9klEQVR4nO2dB3riQAxGYxxTXMCmmWYIEML9b7hxSNlQLGlgZyzv/w7gb16YqhkpT08AAAAAAACAOuDHwaw9Cwau2/Fv8JOXzjD1SqLFtjVz3Z5HE7wMvd9sRr7rRj2QYPnsXbKYNMZxcs2vZJW4btpDiDs3/Er2DfgZk7xC0PPGgesG3kuRVgq+j8bYdRPvI5kTgu+DUfXy2Cb9yo6qeCz2xxxDb++6nea8sAQ9T+2iMaNmmS9WrltqSpcp6HkT1001I2MLekedk82Bb+itXTfWhDASGG5dt9aEQiDopRrPi1OJoTdy3Vw5/k5k2HPdXjmBSFDjkihYK0ryvusGi1nLDOf6DlEjmaGn7yTcEhrqWy6a/xsKx2GqbxwmMsNc3967+ethWB1FPGfqur0G8M+/JRrPwLKpJnPdXAMGdKj0h42+TduTrJtq7KSi9WIXum6sGVWXTr95c91UQ9g/4k7fcv8JN9qmMtL2QXh+eX8dhRGMb1j9dKH6em1CC87brht5H6RirlyQvOYe6jvbX5CtKgS7+g6+VwiXN4egwkj3dbLtNb9oqXoSPSPrnd9EDfeN6KB/EYymw69JJzoeCqV7bYI4S4qiSNpN6p0AAAAAAACA/w4/HIS+2vB6FXGy3k87q2EepdFzvjuOO4dWkTXkgNpvj3qL69G+aDWdJNpPqtkrlQ6Rd0f3BFPiDpPuzRvgYsP7wJXR5a83hN5nwK8zMf4l2Q9O5jeHP/PtWHoxqMKJ4C1I2jMMvLMNn+81jM4M/dGC7/fBwaizOjNMeNlIv8hbBuuII8NBT+5XspAnJ7kxLG7l5NK8SN+8ODF8M9Ur2QpnVQeGfVkOxAXCjFb7hj5vCaxgJ3rJa91wYDCHniP6FW0bDqruYtmMBVtyy4b3d9ET3doabs2ELuHnJds1lKY/VMB+o2XVMOMmHTPYcZdFm4b9Bw3CE9x3aBYN/Qf20RLmo2x7hvnMfDN6FWbWrj3DVHocJClqZvh4xqxjhmZDXiUL1Yas6VS1ISupVbUhK39At+Gx8YacvF3lhoxuqtyw03jDiJ5NlRsyjonaDZeNN6TTPrUbPpNHfaeG8/H0rUhK1pNlh5didg65+3ZnOO+uf//9++2lgWSrrob567XQfPgmSb3+gDxfODLc3xo+wVb4pXEtDStTxbiFHD8hCx+5MCRq2gprylAXUQ4Mx9QEL/sgFVS0b5jTW0lRuQ5q32bfkBE+CiSR1de6GbKiR5KL/kPNDBl99J2B4AqHCn3bNmTWntjzv7ipl2HOvBNjFag+QUWjLBtyr277/Ov+nLjTt2zIfl/4yv5kRHQLu4bkJvIbQe1YYu6ya0itXT/E/EMGsW2za8h/WejzHxYRUWGrhpKiffznmcTG1KohtXSZfZXoGFYN6dDfD/waXcTW26qhpB7aTKUh72nBiZi9Na2ToaQsIb9qJVF8xaahqMKrz44s1siQu+0+ceR+lhjdNg1XomwJ9pJPxIRtGjKuM/+C/cyvRoayfx+xVWgoeLr8JAi4wdCioazSMgzraCirnwlDGMIQhjCEIQxhCEMYwhCGMIQhDGEIQxjCEIYwhCEMYQhDGMIQhjCEIQxhCEMYwhCGMIQhDGEIQxjCEIYwhCEMYQhDGMIQhjCEIQxh6NwwtZ1Dun2QYb/N5HYlnwH3E7L/CBdzP6v9f80CAAAAAACgkT8cAX1Rk70hTQAAAABJRU5ErkJggg==',
              width: 20, // Adjust the width as needed
              height: 20, // Adjust the height as needed
            ),
            onPressed: () {
              html.window.open("https://www.linkedin.com/in/gunjaan/", "Git");
            },
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Tooltip(
        message: 'Github',
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: IconButton(
            icon: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1L5scgDkEGxXn48xr2kUqqXSGcj1t7Au5g&usqp=CAU',
              width: 20, // Adjust the width as needed
              height: 20, // Adjust the height as needed
            ),
            onPressed: () {
              html.window.open("https://github.com/gunjaan", "Git");
            },
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    ];
  }

  Widget copyRightText() => const Text(
        "Gunjan Verma @2023",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: socialMediaWidgets(),
        ),
        copyRightText(),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String projectName;
  final String projectImage;
  final String projectLink;

  const ProjectCard({
    super.key,
    required this.projectName,
    required this.projectImage,
    required this.projectLink,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add action to navigate to project link
        // You can use 'projectLink' to navigate to the corresponding project link.
      },
      child: Card(
        elevation: 2.0,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(projectImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                projectName,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
