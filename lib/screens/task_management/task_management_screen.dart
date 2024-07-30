// lib/screens/task_management/task_management_screen.dart

import 'package:flutter/material.dart';
import '../../providers/mock_task_data_provider.dart';

class TaskManagementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;
  final List<Map<String, dynamic>> reminders;

  TaskManagementScreen({super.key})
      : tasks = MockTaskDataProvider.getTasks(),
        reminders = MockTaskDataProvider.getReminders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildTaskSchedulerSection(context),
              const SizedBox(height: 20),
              _buildRemindersSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskSchedulerSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Task Scheduler',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...tasks.map((task) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.task, color: Colors.blue),
              title: Text(task['title']),
              subtitle: Text('${task['description']} - Due: ${task['dueDate']}'),
              trailing: Text(task['status']),
              onTap: () {
                _showTaskDetails(context, task);
              },
            ),
          );
        }),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addTaskScreen');
          },
          child: const Text('Add New Task'),
        ),
      ],
    );
  }

  Widget _buildRemindersSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Reminders',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...reminders.map((reminder) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.alarm, color: Colors.red),
              title: Text(reminder['title']),
              subtitle: Text('${reminder['date']} - ${reminder['time']}'),
              onTap: () {
                _showReminderDetails(context, reminder);
              },
            ),
          );
        }),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addReminderScreen');
          },
          child: const Text('Add New Reminder'),
        ),
      ],
    );
  }

  void _showTaskDetails(BuildContext context, Map<String, dynamic> task) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                task['title'],
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('Description: ${task['description']}'),
              Text('Due Date: ${task['dueDate']}'),
              Text('Assigned To: ${task['assignedTo']}'),
              Text('Status: ${task['status']}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Update task status or other actions
                },
                child: const Text('Update Task'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showReminderDetails(BuildContext context, Map<String, dynamic> reminder) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                reminder['title'],
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('Date: ${reminder['date']}'),
              Text('Time: ${reminder['time']}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Update reminder or other actions
                },
                child: const Text('Update Reminder'),
              ),
            ],
          ),
        );
      },
    );
  }
}
