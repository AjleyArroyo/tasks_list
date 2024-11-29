import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/domain/repositories/task_repository.dart';

class GetTaskBy {
  final TaskRepository repository;

  GetTaskBy({required this.repository});

  Future<List<Task>> call({bool state = false}){

    return repository.getTaskBy(state);
  }

}