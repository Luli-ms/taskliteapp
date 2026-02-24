import 'package:flutter/material.dart';
import '../models/task.dart';
import 'add_task_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _updateTask() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TaskLite"),
      ),
      body: _tasks.isEmpty
          ? const Center(
              child: Text("No hay tareas todavía"),
            )
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];

                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.priority),
                  trailing: Icon(
                    task.isCompleted
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: task.isCompleted ? Colors.green : null,
                  ),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(task: task),
                      ),
                    );

                    _updateTask();
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push<Task>(
            context,
            MaterialPageRoute(
              builder: (_) => const AddTaskScreen(),
            ),
          );

          if (newTask != null) {
            _addTask(newTask);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}