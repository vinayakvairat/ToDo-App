import 'package:flutter/material.dart';
import 'package:todo_project/util/my_button.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final Future<void> Function() selectStartTime;
  final Future<void> Function() selectEndTime;

  const DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.selectStartTime,
    required this.selectEndTime,
  }) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                MyButton(
                  text: "Select start time",
                  onPressed: widget.selectStartTime,
                ),
                const SizedBox(width: 8),
                MyButton(
                  text: "Select end time",
                  onPressed: widget.selectEndTime,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Save",
                  onPressed: widget.onSave,
                ),
                const SizedBox(width: 8),
                MyButton(
                  text: "Cancel",
                  onPressed: widget.onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
