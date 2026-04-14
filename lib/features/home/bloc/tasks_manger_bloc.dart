// TODO  3- bloc   هربطهم ببعض في ال bloc  // on<Event >((event, emit) async { emit(LoadingState()); await Future.delayed(const Duration(seconds: 2)); emit(SuccessState()); });
//  TODO 4- provider and builder
//  TODO 5- ui // context.read<TasksMangerBloc>().add(TaskMangerEventAddTask(task: 'New Task'));
//  TODO 6- if (state is TasksMangerLoadingState) { return

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:nti_repo/features/home/data/models/task_data_class.dart';
import 'package:nti_repo/features/home/data/repos/dummey_tasks_list.dart';

part 'tasks_manger_event.dart';
part 'tasks_manger_state.dart';

class TasksMangerBloc extends Bloc<TasksMangerEvent, TasksMangerState> {
  TasksMangerBloc() : super(TasksMangerInitial()) {
    //
    on<LoadTasksEvent>((event, emit) {
      emit(TasksMangerLoadingState());

      try {
        emit(TasksMangerLoadedState(tasks: dummyTasksList));
        if (dummyTasksList.isEmpty) {
          emit(TasksMangerEmptyState());
        }
      } catch (e) {
        emit(TasksMangerFailureState(errorMessage: e.toString()));
      }
    });

    ///
    ///
    on<TaskMangerEventAddTask>((event, emit) {
      try {
        emit(TasksMangerLoadingState());
        dummyTasksList.add(
          TaskDataClass(
            task: event.task.task,
            description: 'Description for ${event.task.description}',
            taskId: (dummyTasksList.length + 1).toString(),
          ),
        );
        //
        Future.delayed(const Duration(seconds: 2), () {
          emit(TasksMangerSuccessState(tasks: [dummyTasksList.last]));
        });
      } catch (e) {
        emit(TasksMangerFailureState(errorMessage: e.toString()));
      }
    });
    //
    on<TaskMangerEventRemoveTask>((event, emit) {
      // emit(TasksMangerLoadingState());
      emit(TasksMagangerDelettedState(taskId: event.task));
      dummyTasksList.removeWhere((task) => task.taskId == event.task);

      emit(TasksMangerSuccessState(tasks: dummyTasksList));
    });
    //
  }
}
