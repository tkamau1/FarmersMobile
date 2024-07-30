// lib/providers/mock_task_data_provider.dart

class MockTaskDataProvider {
  static final List<Map<String, dynamic>> _tasks = [
    {
      'title': 'Plant Seeds',
      'description': 'Plant the new batch of seeds in the north field.',
      'dueDate': '2023-07-25',
      'assignedTo': 'John Doe',
      'status': 'Pending',
    },
    {
      'title': 'Irrigation Check',
      'description': 'Ensure all irrigation systems are working properly.',
      'dueDate': '2023-07-26',
      'assignedTo': 'Jane Smith',
      'status': 'Pending',
    },
  ];

  static final List<Map<String, dynamic>> _reminders = [
    {
      'title': 'Fertilize Crops',
      'date': '2023-07-20',
      'time': '10:00 AM',
    },
    {
      'title': 'Water Plants',
      'date': '2023-07-21',
      'time': '08:00 AM',
    },
  ];

  static List<Map<String, dynamic>> getTasks() {
    return _tasks;
  }

  static List<Map<String, dynamic>> getReminders() {
    return _reminders;
  }

  static void addTask(Map<String, dynamic> task) {
    _tasks.add(task);
  }

  static void updateTask(int index, Map<String, dynamic> updatedTask) {
    _tasks[index] = updatedTask;
  }

  static void addReminder(Map<String, dynamic> reminder) {
    _reminders.add(reminder);
  }

  static void updateReminder(int index, Map<String, dynamic> updatedReminder) {
    _reminders[index] = updatedReminder;
  }
}
