import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const CourseCard({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: course.imageUrl.startsWith('assets/')
                    ? Image.asset(
                        course.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 40),
                      )
                    : Image.network(
                        course.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 40),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            width: 80,
                            height: 80,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      course.instructor,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          "${course.rating}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.schedule, color: Colors.grey, size: 16),
                        Text(
                          "${course.duration}h",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (course.price > 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${course.price.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Enroll",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green),
                    ),
                  ],
                )
              else
                Text(
                  "Free",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green),
                ),
            ],
          ),
        ),
      ),
    );
  }
}