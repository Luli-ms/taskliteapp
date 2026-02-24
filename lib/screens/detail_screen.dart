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
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Chip(
                  label: Text("Prioridad: ${widget.task.priority}"),
                  backgroundColor: widget.task.priority == "Alta"
                      ? Colors.red[200]
                      : widget.task.priority == "Media"
                          ? Colors.orange[200]
                          : Colors.green[200],
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: const Text("Completada"),
                  value: widget.task.isCompleted,
                  onChanged: (value) {
                    setState(() {
                      widget.task.isCompleted = value;
                    });
                  },
                  activeColor: Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}