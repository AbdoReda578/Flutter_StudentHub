import 'package:flutter/material.dart';
import 'package:studenthub/models/course.dart';
import '../widgets/course_card.dart';
import '../utils/constants.dart';
import 'package:studenthub/screens/course_detail.dart';
import 'package:studenthub/screens/add_course.dart';
import 'package:studenthub/screens/profile.dart';
import 'package:studenthub/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool)? onThemeChanged;

  const HomeScreen({super.key, this.onThemeChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _refreshCourseList() {
    setState(() {
      // This will trigger a rebuild of the IndexedStack and HomeBody
    });
  }

  List<Widget> get _pages => [
    HomeBody(key: ValueKey(courses.length)), // Key ensures rebuild when courses change
    AddCourseScreen(onCourseAdded: _refreshCourseList),
    const ProfileScreen(),
    SettingsScreen(onThemeChanged: widget.onThemeChanged),
  ];

  @override
  Widget build(BuildContext context) {
    final Color inactiveColor = Colors.grey.shade500;
    final Color backgroundColor = Colors.black;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 15,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: inactiveColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
          ),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_outlined,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              "No Courses Yet",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Add your first course using the + tab below",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return CourseCard(
          course: course,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CourseDetailScreen(course: course),
              ),
            );
          },
        );
      },
    );
  }
}


