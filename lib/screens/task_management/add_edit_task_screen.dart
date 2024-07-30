// lib/screens/add_edit_task_screen.dart

import 'package:flutter/material.dart';
import '../../providers/mock_task_data_provider.dart';

class AddEditTaskScreen extends StatefulWidget {
  final Map<String, dynamic>? task;
  final int? taskIndex;

  const AddEditTaskScreen({Key? key, this.task, this.taskIndex}) : super(key: key);

  @override
  _AddEditTaskScreenState createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _dueDate;
  late String _assignedTo;
  late String _status;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _title = widget.task!['title'];
      _description = widget.task!['description'];
      _dueDate = widget.task!['dueDate'];
      _assignedTo = widget.task!['assignedTo'];
      _status = widget.task!['status'];
    } else {
      _title = '';
      _description = '';
      _dueDate = '';
      _assignedTo = '';
      _status = 'Pending';
    }
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newTask = {
        'title': _title,
        'description': _description,
        'dueDate': _dueDate,
        'assignedTo': _assignedTo,
        'status': _status,
      };
      if (widget.taskIndex != null) {
        MockTaskDataProvider.updateTask(widget.taskIndex!, newTask);
      } else {
        MockTaskDataProvider.addTask(newTask);
      }
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task != null ? 'Edit Task' : 'Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  initialValue: _title,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                TextFormField(
                  initialValue: _description,
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                TextFormField(
                  initialValue: _dueDate,
                  decoration: const InputDecoration(labelText: 'Due Date'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a due date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _dueDate = value!;
                  },
                ),
                TextFormField(
                  initialValue: _assignedTo,
                  decoration: const InputDecoration(labelText: 'Assigned To'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a person';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _assignedTo = value!;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _status,
                  decoration: const InputDecoration(labelText: 'Status'),
                  items: <String>['Pending', 'Completed'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _status = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveTask,
                  child: const Text('Save Task'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
