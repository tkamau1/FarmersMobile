// lib/screens/task_management/add_edit_reminder_screen.dart

import 'package:flutter/material.dart';
import '../../providers/mock_task_data_provider.dart';

class AddEditReminderScreen extends StatefulWidget {
  final Map<String, dynamic>? reminder;
  final int? reminderIndex;

  const AddEditReminderScreen({Key? key, this.reminder, this.reminderIndex}) : super(key: key);

  @override
  _AddEditReminderScreenState createState() => _AddEditReminderScreenState();
}

class _AddEditReminderScreenState extends State<AddEditReminderScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _date;
  late String _time;

  @override
  void initState() {
    super.initState();
    _title = widget.reminder?['title'] ?? '';
    _date = widget.reminder?['date'] ?? '';
    _time = widget.reminder?['time'] ?? '';
  }

  void _saveReminder() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newReminder = {
        'title': _title,
        'date': _date,
        'time': _time,
      };

      if (widget.reminder == null) {
        MockTaskDataProvider.addReminder(newReminder);
      } else {
        MockTaskDataProvider.updateReminder(widget.reminderIndex!, newReminder);
      }

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reminder == null ? 'Add Reminder' : 'Edit Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: _title,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) => _title = value!,
                ),
                TextFormField(
                  initialValue: _date,
                  decoration: const InputDecoration(labelText: 'Date'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a date';
                    }
                    return null;
                  },
                  onSaved: (value) => _date = value!,
                ),
                TextFormField(
                  initialValue: _time,
                  decoration: const InputDecoration(labelText: 'Time'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a time';
                    }
                    return null;
                  },
                  onSaved: (value) => _time = value!,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveReminder,
                  child: const Text('Save Reminder'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
