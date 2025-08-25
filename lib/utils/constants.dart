// lib/utils/constants.dart
import 'package:studenthub/models/course.dart';

List<Course> courses = [
  Course(
    id: "1",
    title: "Flutter Basics",
    description: "Learn widgets, layout, and navigation in Flutter.",
    imageUrl: 'assets/images/f1.png',
    instructor: "Dr. Mohamed Hisham",
    duration: 40,
    rating: 4.8,
    price: 0.0,
  ),
  Course(
    id: "2",
    title: "Dart Programming",
    description: "Master Dart syntax, OOP, and async programming.",
    imageUrl: 'assets/images/d1.png',
    instructor: "Prof. Ali Mahmoud",
    duration: 30,
    rating: 4.6,
    price: 0.0,
  ),
  Course(
    id: "3",
    title: "UI/UX Design",
    description: "Design beautiful mobile interfaces with Figma and Flutter.",
    imageUrl: 'assets/images/f1.png',
    instructor: "Lena Khalid",
    duration: 25,
    rating: 4.9,
    price: 29.99,
  ),
];