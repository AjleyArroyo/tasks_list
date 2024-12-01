import 'package:get_it/get_it.dart';
import 'package:tasks/features/task_list/data/datasoruces/task_firebase_datasoruce.dart';
import 'package:tasks/features/task_list/data/repositories/task_repository_impl.dart';
import 'package:tasks/features/task_list/domain/repositories/task_repository.dart';
import 'package:tasks/features/task_list/domain/use_cases/create_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/delete_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/get_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/get_task_by.dart';
import 'package:tasks/features/task_list/domain/use_cases/update_task.dart';
import 'package:tasks/features/task_list/presentation/bloc/task_bloc.dart';

//Clase para le manejo de las dependencias

GetIt getIt = GetIt.instance;

void ServiceLocatorInit(){

  //Blocs
  getIt.registerFactory(() => TaskBloc(getIt(),getIt(),getIt(),getIt(),getIt()));

  //Casos de uso
  getIt.registerLazySingleton(() => CreateaskUseCase(repository: getIt()),);
  getIt.registerLazySingleton(() => UpdateTaskUseCase(repository: getIt()),);
  getIt.registerLazySingleton(() => DeleteTaskUseCase(repository: getIt()),);
  getIt.registerLazySingleton(() => GetTaskUseCase(repository: getIt()),);
  getIt.registerLazySingleton(() => GetTaskByUseCase(repository: getIt()),);

  //Repositorios
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(taskFirebaseDatasoruce: getIt()),);

  //Datasoruce
  getIt.registerLazySingleton<TaskFirebaseDatasoruce>(() => TaskFirebaseDataSourceImpl(),);
}