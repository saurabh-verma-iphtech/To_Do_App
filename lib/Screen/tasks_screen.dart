import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../task_provider.dart';
import 'add_task_screen.dart';
import 'edit_task_screen.dart';
import '../task.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do App'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return ListTile(
                title: Text(
                  task.title,
                  style: TextStyle(
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(

                      icon: Icon(
                          Icons.edit,
                              color:Colors.green
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditTaskScreen(
                              taskId: task.id,
                              currentTitle: task.title,
                            ),
                          ),
                        );
                      },
                    ),

                    IconButton(
                      icon: Icon(
                          Icons.delete,
                              color:Colors.red,
                      ), // Add a delete icon
                      onPressed: () {
                        taskProvider.deleteTask(task.id); // Delete the task
                      },
                    ),
                    Checkbox(
                      value: task.isDone,
                      onChanged: (value) {
                        taskProvider.toggleTask(task.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
        child: Icon(Icons.add), // Use the "+" icon
      ),
    );
  }
}