import 'package:tasks/features/task_list/data/models/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TaskFirebaseDatasoruce {
  Future<bool> createTask(TaskModel task);
  Future<List<TaskModel>> getTasks();
  Future<List<TaskModel>> getTasksBy({bool state = false});
  Future<bool> updateTask(String id, bool state);
  Future<bool> deleteTask(String id);
}

class TaskFirebaseDataSourceImpl implements TaskFirebaseDatasoruce {
  static const String collectionTask = 'tasks';

  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  @override
  Future<bool> deleteTask(String id) async{
    _firebase.collection(collectionTask).doc("id").delete();
    return true;
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks = [];

    await _firebase.collection(collectionTask).get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        tasks.add(TaskModel.fromJson(docSnapshot.data()));
      }
    });
    return tasks;
  }

  @override
  Future<bool> updateTask(String id, bool state) async{
    await _firebase.collection(collectionTask).doc(id).set({'state':state});
    return true;
  }

  @override
  Future<bool> createTask(TaskModel task) async {
    await _firebase.collection(collectionTask).add(task.toJson());
    return true;
    
  }
  
  @override
  Future<List<TaskModel>> getTasksBy({bool state = false}) async {
    List<TaskModel> tasks = [];
    await _firebase.collection(collectionTask).where('state', isEqualTo: state).get().then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        tasks.add(TaskModel.fromJson(docSnapshot.data()));
      }
    });
    return tasks;
  }


}
