part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class OnGetTask extends TaskEvent {}

class OnCreateTask extends TaskEvent {
  final Task task;

  OnCreateTask({required this.task});

}

class OnEditTask extends TaskEvent {
  final String id;
  final bool state;

  OnEditTask({required this.id, required this.state});
}

class OnDeleteTask extends TaskEvent {
  final String id;

  OnDeleteTask({required this.id});
}