
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/domain/use_cases/create_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/delete_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/get_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/update_task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  final CreateaskUseCase _createaskUseCase;

  final GetTaskUseCase _getTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  TaskBloc(this._createaskUseCase, this._getTaskUseCase, this._updateTaskUseCase, this._deleteTaskUseCase) : super(TaskInitial()) {
    //Evento para obtener la lista de tareas
    on<OnGetTask>((event, emit) async{
      emit(TaskLoading());
      try {
        final resp =  await _getTaskUseCase();
        emit (TaskListLoaded(taskList: resp));
      }catch (e){
        emit(TaskFailure());
      }
      
    });
    //Evento para crear 
    on<OnCreateTask>((event, emit) async{
      emit(TaskLoading());
      try {
        await _createaskUseCase(event.task);
        add(OnGetTask());
      }catch (e){
        emit(TaskFailure());
      }
      
    });
    on<OnEditTask>((event, emit) async{
      emit(TaskLoading());
      try {
        await _updateTaskUseCase(event.id, event.state);
        add(OnGetTask());
      }catch (e){
        emit(TaskFailure());
      }
      
    });

    on<OnDeleteTask>((event, emit) async{
      emit(TaskLoading());
      try {
        await _deleteTaskUseCase(event.id);
        add(OnGetTask());
      }catch (e){
        emit(TaskFailure());
      }
      
    });

   
  }
}
