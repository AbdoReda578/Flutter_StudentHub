// lib/screens/course_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(course.title),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: course.imageUrl.startsWith('assets/')
                  ? Image.asset(
                      course.imageUrl,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 100),
                    )
                  : Image.network(
                      course.imageUrl,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 100),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 18),

            // Title
            Text(
              course.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Instructor
            Text(
              "Instructor: ${course.instructor}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            // Rating & Duration
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  "${course.rating}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 16),
                const Icon(Icons.schedule, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  "${course.duration} hours",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Price
            Text(
              course.price > 0
                  ? "Price: \$${course.price.toStringAsFixed(2)}"
                  : "Free Course",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: course.price > 0
                    ? Theme.of(context).colorScheme.primary
                    : Colors.green,
              ),
            ),
            const SizedBox(height: 20),

            // Description
            Text(
              "Description",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              course.description,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
