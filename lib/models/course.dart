class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String instructor;
  final int duration;
  final double rating;
  final double price;

  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.instructor,
    required this.duration,
    required this.rating,
    required this.price,
  });

  Course copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? instructor,
    int? duration,
    double? rating,
    double? price,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      instructor: instructor ?? this.instructor,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'imageUrl': imageUrl,
    'instructor': instructor,
    'duration': duration,
    'rating': rating,
    'price': price,
  };

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      instructor: json['instructor']?.toString() ?? '',
      duration: int.tryParse(json['duration']?.toString() ?? '') ?? 0,
      rating: double.tryParse(json['rating']?.toString() ?? '') ?? 0.0,
      price: double.tryParse(json['price']?.toString() ?? '') ?? 0.0,
    );
  }

  @override
  String toString() =>
      'Course(id: $id, title: $title, description: $description, imageUrl: $imageUrl, instructor: $instructor, duration: $duration, rating: $rating, price: $price)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Course &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              description == other.description &&
              imageUrl == other.imageUrl &&
              instructor == other.instructor &&
              duration == other.duration &&
              rating == other.rating &&
              price == other.price;

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    imageUrl,
    instructor,
    duration,
    rating,
    price,
  );
}
