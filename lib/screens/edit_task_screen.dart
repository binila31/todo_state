// screens/edit_task_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class EditTaskScreen extends StatefulWidget {
  final int taskIndex;

  EditTaskScreen({required this.taskIndex});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    _titleController =
        TextEditingController(text: taskProvider.tasks[widget.taskIndex].title);
    _categoryController = TextEditingController(
        text: taskProvider.tasks[widget.taskIndex].category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Save Changes'),
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _categoryController.text.isNotEmpty) {
                  Provider.of<TaskProvider>(context, listen: false).editTask(
                    widget.taskIndex,
                    _titleController.text,
                    _categoryController.text,
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
