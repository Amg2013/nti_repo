part of 'tasks_manger_bloc.dart';

@immutable
sealed class TasksMangerState {}

class TasksMangerInitial extends TasksMangerState {}

class TasksMangerLoadingState extends TasksMangerState {}

class TasksMangerLoadedState extends TasksMangerState {
  //
  final List<TaskDataClass> tasks;
  //
  TasksMangerLoadedState({required this.tasks});
}

class TasksMangerSuccessState extends TasksMangerState {
  final List<TaskDataClass> tasks;

  TasksMangerSuccessState({required this.tasks});
}

class TasksMangerFailureState extends TasksMangerState {
  final String errorMessage;

  TasksMangerFailureState({required this.errorMessage});
}

class TasksMangerEmptyState extends TasksMangerState {}

class TasksMagangerDelettedState extends TasksMangerState {
  final String taskId;

  TasksMagangerDelettedState({required this.taskId});
}



//


//


//