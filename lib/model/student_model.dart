class Student {
  final String name;
  final String course;
  final double score;

  Student({
    required this.name,
    required this.course,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'course': course,
      'score': score,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      course: map['course'],
      score: map['score'],
    );
  }
}