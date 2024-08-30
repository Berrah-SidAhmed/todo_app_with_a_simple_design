import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  int totalTodos;
  int todos;
  Counter({required this.totalTodos, required this.todos});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$todos/$totalTodos",
        style: TextStyle(fontSize: 50, color: totalTodos == todos ? Colors.green : Colors.black  ),
        
      ),
    );
  }
}
