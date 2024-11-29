import 'package:tasks/features/task_list/data/datasoruces/task_firebase_datasoruce.dart';
import 'package:tasks/features/task_list/data/models/task_model.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/domain/repositories/task_repository.dart';


class TaskRepositoryImpl extends TaskRepository {

  final TaskFirebaseDatasoruce taskFirebaseDatasoruce;

  TaskRepositoryImpl({required this.taskFirebaseDatasoruce});
  @override
  Future<bool> deleteTask({required id}) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTask() {
    return taskFirebaseDatasoruce.getTasks();
  }

  @override
  Future<bool> updateTask({required id,required state}) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
  
  @override
  Future<bool> createTask(Task task) {
    return taskFirebaseDatasoruce.createTask(TaskModel.fromEntity(task));
  }
  
  @override
  Future<List<Task>> getTaskBy(bool state) {
    // TODO: implement getTaskBy
    throw UnimplementedError();
  }
  
  
  
}
