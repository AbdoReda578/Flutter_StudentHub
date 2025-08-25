import 'package:flutter/material.dart';
import 'package:studenthub/utils/constants.dart';
import 'package:studenthub/widgets/custom_text_field.dart';
import 'package:studenthub/models/course.dart';

class AddCourseScreen extends StatefulWidget {
  final VoidCallback? onCourseAdded;

  const AddCourseScreen({super.key, this.onCourseAdded});

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();

  void _addCourse() {
    if (_formKey.currentState!.validate()) {
      final String title = _titleController.text.trim();
      final String description = _descriptionController.text.trim();
      final String imageUrl = _imageUrlController.text.trim();

      // Create proper Course object with all required fields
      final newCourse = Course(
        id: DateTime.now().millisecondsSinceEpoch.toString(), // Generate unique ID
        title: title,
        description: description,
        imageUrl: imageUrl,
        instructor: "Student", // Default instructor for user-added courses
        duration: 20, // Default duration
        rating: 0.0, // Default rating for new courses
        price: 0.0, // Default to free
      );

      // Add to global list
      courses.add(newCourse);

      // Trigger UI update in Home
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Course Added Successfully")),
        );

        // Clear form
        _formKey.currentState!.reset();
        _titleController.clear();
        _descriptionController.clear();
        _imageUrlController.clear();

        // Notify parent to refresh the course list
        widget.onCourseAdded?.call();
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Course"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Course Title
              CustomTextField(
                label: "Course Title",
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Course title is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),

              CustomTextField(
                label: "Description",
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description is required";
                  }
                  if (value.length < 10) {
                    return "Description is too short";
                  }
                  return null;
                },
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 16),

              // Image URL
              CustomTextField(
                label: "Image URL",
                controller: _imageUrlController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Image URL is required";
                  }
                  // Basic URL validation
                  final urlPattern = r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$';
                  final assetPattern = r'^assets\/images\/[\w\.-]+\.(png|jpg|jpeg|gif|webp)$';

                  if (!RegExp(urlPattern, caseSensitive: false).hasMatch(value) &&
                      !RegExp(assetPattern, caseSensitive: false).hasMatch(value)) {
                    return "Please enter a valid URL or asset path";
                  }
                  return null;
                },
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _addCourse,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Add Course",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}