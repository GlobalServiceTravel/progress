class Task {
  String title;
  String description;
  DateTime dueDate;
  String assignedTo;
  String status;
  DateTime completionDate;
  String comments;
  DateTime creationDate;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.assignedTo,
    required this.status,
    required this.completionDate,
    required this.comments,
    required this.creationDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'assignedTo': assignedTo,
      'status': status,
      'completionDate': completionDate,
      'comments': comments,
      'creationDate': creationDate.toIso8601String(),
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['name'],
      description: map['description'],
      dueDate: DateTime.parse(map['dueDate']),
      assignedTo: map['assignedTo'],
      status: map['status'],
      completionDate: map['completionDate'],
      comments: map['comments'],
      creationDate: DateTime.parse(map['creationDate']),
    );
  }

  @override
  String toString() {
    return 'Task{name: $title, description: $description, dueDate: $dueDate, assignedTo: $assignedTo, '
        'status: $status, completionDate: $completionDate, comments: $comments, creationDate: $creationDate}';
  }
}
