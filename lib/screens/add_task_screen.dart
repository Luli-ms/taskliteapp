import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  String _selectedPriority = "Media";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva tarea"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Título",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "El título es obligatorio";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                initialValue: _selectedPriority,
                decoration: const InputDecoration(
                  labelText: "Prioridad",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: "Baja", child: Text("Baja")),
                  DropdownMenuItem(value: "Media", child: Text("Media")),
                  DropdownMenuItem(value: "Alta", child: Text("Alta")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedPriority = value!;
                  });
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = Task(
                      title: _titleController.text.trim(),
                      priority: _selectedPriority,
                    );

                    Navigator.pop(context, task);
                  }
                },
                child: const Text("Guardar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}