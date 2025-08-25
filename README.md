Student Hub App

Student: Abdulrahman Reda Abuzaid
Class: W4

App Description

Student Hub is a comprehensive Flutter mobile application designed for students to manage and explore educational courses. The app provides an intuitive interface for browsing available courses, viewing detailed course information, adding new courses, managing user profiles, and customizing app settings.

Features

 Core Features
- Course Browsing: View all available courses in an organized list format
- Course Details: Access comprehensive information about each course including:
  - Course title and description
  - Instructor information
  - Duration and rating
  - Pricing information
  - Course images
- Add New Courses: Create and add new courses with:
  - Course title and description
  - Image URL (supports both web URLs and local assets)
  - Form validation and error handling
- User Profile: Personal profile page with student information
- Settings: Customizable app preferences

### Extra Features ⭐
- **Dark Mode Toggle**: Fully functional light/dark theme switching with proper color adaptation
- **Image Picker**: Choose images from phone gallery or select from built-in assets
- **Real-time Updates**: Course list updates immediately when new courses are added
- **Multi-format Image Support**: Handles local files, assets, and network images with loading states
- **Form Validation**: Comprehensive validation with user-friendly error messages
- **Empty State Handling**: Friendly messages when no courses are available
- **Responsive Design**: Clean, modern UI with consistent Material Design principles

Technical Implementation

 Architecture
- Clean Code Structure: Organized into separate folders for models, screens, widgets, and utilities
- Reusable Components: Custom widgets for consistent UI elements
- State Management: Proper state management with callback patterns
- Navigation: Bottom navigation bar with IndexedStack for smooth transitions

 Key Widgets Used
- Scaffold & AppBar
- BottomNavigationBar
- ListView & ListTile
- Image.asset & Image.network
- TextField with validation
- ElevatedButton & Card
- SnackBar notifications
- SwitchListTile for settings

 File Structure

lib/
├── main.dart                  App entry point
├── models/
│   └── course.dart           Course data model
├── screens/
│   ├── homepage.dart         Home screen with course list
│   ├── course_detail.dart    Course detail view
│   ├── add_course.dart       Add new course form
│   ├── profile.dart          User profile screen
│   └── settings.dart         App settings
├── widgets/
│   ├── course_card.dart      Reusable course card widget
│   └── custom_text_field.dart  Custom form field widget
└── utils/
    └── constants.dart        App constants and sample data


Developed by Abdulrahman Reda Abuzaid for W4 Flutter Summer Training Project.
