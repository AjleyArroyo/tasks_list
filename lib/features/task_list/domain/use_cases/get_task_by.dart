import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/domain/repositories/task_repository.dart';

class GetTaskByUseCase {
  final TaskRepository repository;

  GetTaskByUseCase({required this.repository});

  Future<List<Task>> call({bool state = false}){

    return repository.getTaskBy(state);
  }

}