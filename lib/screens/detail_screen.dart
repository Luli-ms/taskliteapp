import 'package:flutter/material.dart';
import '../models/task.dart';

class DetailScreen extends StatefulWidget {
  final Task task;

  const DetailScreen({super.key, required this.task});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de tarea"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Prioridad: ${widget.task.priority}"),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text("Completada"),
              value: widget.task.isCompleted,
              onChanged: (value) {
                setState(() {
                  widget.task.isCompleted = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}