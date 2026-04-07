import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_repo/features/home/bloc/tasks_manger_bloc.dart';
import 'package:nti_repo/features/home/data/models/task_data_class.dart';
import 'package:nti_repo/features/home/data/repos/dummey_tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<TaskDataClass> tasks = [];
  @override
  void initState() {
    super.initState();
    //
    // context.read<TasksMangerBloc>().add(LoadTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksMangerBloc()..add(LoadTasksEvent()),

      //
      child: Scaffold(
        appBar: AppBar(title: Text('Tasks')),

        //
        body: BlocConsumer<TasksMangerBloc, TasksMangerState>(
          listener:
          
           (context, state) {
            if (state is TasksMangerFailureState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            } else if (state is TasksMagangerDelettedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Task with id ${state.taskId} has been deleted',
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is TasksMangerLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TasksMangerSuccessState) {
              tasks = state.tasks;
            } else if (state is TasksMangerLoadedState) {
              tasks = state.tasks;
            }

            return Column(
              children: [
                TextField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    labelText: 'Task',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 30),

                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Task ${tasks[index].task}'),
                        subtitle: Text(
                          'Description for Task ${tasks[index].description}',
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context.read<TasksMangerBloc>().add(
                              TaskMangerEventRemoveTask(
                                task: tasks[index].taskId.toString(),
                              ),
                            );
                            // Handle task deletion
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var task = TaskDataClass(
              task: _taskController.text,
              description: _descriptionController.text,
              taskId: DateTime.now().millisecondsSinceEpoch.toString(),
            );
            // Handle adding a new task
            context.read<TasksMangerBloc>().add(
              TaskMangerEventAddTask(task: task),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
