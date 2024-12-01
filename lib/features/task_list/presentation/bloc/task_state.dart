part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskListLoaded extends TaskState {
  final List<Task> taskList;

  TaskListLoaded({required this.taskList});

}

final class TaskSuccess extends TaskState {}

final class TaskFailure extends TaskState {}
