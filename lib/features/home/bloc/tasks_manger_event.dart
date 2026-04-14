part of 'tasks_manger_bloc.dart';

@immutable
sealed class TasksMangerEvent {}

class TaskMangerEventAddTask extends TasksMangerEvent {
  final TaskDataClass task;

  TaskMangerEventAddTask({required this.task});
}

class LoadTasksEvent extends TasksMangerEvent {}

class TaskMangerEventRemoveTask extends TasksMangerEvent {
  final String task;

  TaskMangerEventRemoveTask({required this.task});
}

class TaskMangerEventUpdateTask extends TasksMangerEvent {
  final String taskId;
  final String? newTask;
  final String? newDescription;

  TaskMangerEventUpdateTask({
    required this.taskId,
    this.newTask,
    this.newDescription,
  });
}
