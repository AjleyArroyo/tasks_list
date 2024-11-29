import 'package:tasks/features/task_list/domain/entities/task.dart';

//Clase abstracta que contiene los metodos que se consultaran de la BD o de un endpoint
abstract class TaskRepository {
  Future<bool> createTask(Task task);
  Future<List<Task>> getTask();
  Future<List<Task>> getTaskBy(bool state);
  Future<bool> updateTask({required String id, required state});
  Future<bool> deleteTask({required id});
}