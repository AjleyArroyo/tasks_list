import 'package:tasks/task_list/domain/entities/task.dart';

abstract class TaskRepository {
  Future<Task> getTask({state = false});
  Future<bool> updateTask({required state});
  Future<bool> deleteTask({required id});
}