class Todo {
  final String title;
  final String description;
  final int priority;
  final DateTime? dueDate;

  const Todo({
    required this.title,
    required this.description,
    required this.priority,
    this.dueDate,
  });
}
