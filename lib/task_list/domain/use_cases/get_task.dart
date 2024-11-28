import 'package:tasks/task_list/domain/entities/task.dart';
import 'package:tasks/task_list/domain/repositories/task_repository.dart';

class GetTaskUseCase {
  final TaskRepository repository;

  GetTaskUseCase({required this.repository});

  Future<Task> call(bool state){

    return repository.getTask(state: state);
  }

}