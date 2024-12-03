part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}


//Evento obtener lista de tareas
class OnGetTask extends TaskEvent {}

//Evento para crear una tarea
class OnCreateTask extends TaskEvent {
  final Task task;

  OnCreateTask({required this.task});

}
//Evento para editar (cambiar estado de la tarea)
class OnEditTask extends TaskEvent {
  final String id;
  final bool state;

  OnEditTask({required this.id, required this.state});
}

//Evento para eliminar una tarea
class OnDeleteTask extends TaskEvent {
  final String id;

  OnDeleteTask({required this.id});
}