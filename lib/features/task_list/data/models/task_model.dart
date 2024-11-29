import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';

class TaskModel extends Task{
 

  TaskModel({required super.id, required super.name, required super.description, required super.state});

  factory TaskModel.fromJson(json){
    return TaskModel(id: json['id'], name: json['name'], description: json['description'], state: json['state']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'description': description,
      'state': state
    };
  }
  //Parsea la entidad al modelo
  factory TaskModel.fromEntity(Task task){
    return TaskModel(id: task.id, name: task.name, description: task.description, state: task.state);
  }

  
}