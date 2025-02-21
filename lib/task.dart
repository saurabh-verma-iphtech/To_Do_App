class Task {
  final String id;
  String title;
  bool isDone; // Ensure this property is defined

  Task({
    required this.id,
    required this.title,
    this.isDone = false, // Default value is false
  });

  void toggleDone() {
    isDone = !isDone;
  }
}