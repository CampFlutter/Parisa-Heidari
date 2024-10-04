import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/createTaskPage/CreateTaskPage.dart';
import 'package:todo2/db/drift_database.dart';
import 'package:todo2/widgets/TaskWidget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required AppDatabase appDatabase});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final appDatabase = Provider.of<AppDatabase>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 206, 223, 1),
      appBar: AppBar(
        shape: const Border(
            bottom:
                BorderSide(color: Color.fromRGBO(135, 92, 206, 1), width: 2)),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(135, 92, 206, 1),
          size: 35,
          shadows: [Shadow(blurRadius: 3, color: Colors.black)],
        ),
        backgroundColor: const Color.fromRGBO(255, 120, 196, 1),
        title: const Text(
          "Tasks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(blurRadius: 10, color: Color.fromRGBO(255, 62, 165, 1))
            ],
          ),
        ),
      ),
      body: StreamBuilder<List<Task>>(
        stream: appDatabase.watchAllTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No tasks available. Add a task using the + button.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          final tasks = snapshot.data ?? [];
          print("Task List Updated: ${tasks.length} tasks found");

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskWidget(
                taskName: task.taskName,
                subject: task.subject,
                timeHour: task.timeHour,
                timeMinute: task.timeMinute,
                timeAmOrPm: task.timeAmOrPm,
                description: task.description,
                onDelete: () async {
                  await appDatabase.deleteTask(task.id);
                  setState(() {});
                },
                onUpdate: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateTaskPage(
                        existingTask: task,
                        onCreate: (String taskName,
                            String subject,
                            String? timeHour,
                            String? timeMinute,
                            String? timeAmOrPm,
                            String? description) async {
                          final updatedTask = TasksCompanion(
                            id: Value(task.id),
                            taskName: Value(taskName),
                            subject: Value(subject),
                            timeHour: Value(timeHour),
                            timeMinute: Value(timeMinute),
                            timeAmOrPm: Value(timeAmOrPm),
                            description: Value(description),
                          );
                          await appDatabase.onUpdate(updatedTask);
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTaskPage(
                onCreate: (String taskName,
                    String subject,
                    String? timeHour,
                    String? timeMinute,
                    String? timeAmOrPm,
                    String? description) async {
                  final newTask = TasksCompanion(
                    taskName: Value(taskName),
                    subject: Value(subject),
                    timeHour: Value(timeHour),
                    timeMinute: Value(timeMinute),
                    timeAmOrPm: Value(timeAmOrPm),
                    description: Value(description),
                  );
                  await appDatabase.insertTask(newTask);
                  setState(() {});
                },
              ),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 128, 3, 96),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}



              // TaskWidget(
              //   taskName: task,
              //   onDelete: () async {
              //     await appDatabase.deleteTask(task.id);
              //     // setState(() {});   ////coment new
              //   },
              //   onUpdate: () async {
              //     await Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => CreateTaskPage(
              //           existingTask: task, // Pass the task to the edit page
              //           onCreate: (String taskName,
              //               String subject,
              //               String? timeHour,
              //               String? timeMinute,
              //               String? timeAmOrPm,
              //               String? description) async {
              //             final updatedTask = TasksCompanion(
              //               id: Value(task.id),
              //               taskName: Value(taskName),
              //               subject: Value(subject),
              //               timeHour: Value(timeHour),
              //               timeMinute: Value(timeMinute),
              //               timeAmOrPm: Value(timeAmOrPm),
              //               description: Value(description),
              //             );
              //             await appDatabase.onUpdate(updatedTask);
              //             // setState(() {}); // Refresh task list  ///new comment
              //           },
              //         ),
              //       ),
              //     );
              //   },
              // );