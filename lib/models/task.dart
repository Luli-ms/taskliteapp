class Task {
  String title;
  String priority; // Baja, Media, Alta
  bool isCompleted;

  Task({
    required this.title,
    required this.priority,
    this.isCompleted = false,
  });
}