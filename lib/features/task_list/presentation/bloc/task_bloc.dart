import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/domain/use_cases/create_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/delete_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/get_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/get_task_by.dart';
import 'package:tasks/features/task_list/domain/use_cases/update_task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  final CreateaskUseCase _createaskUseCase;
  final GetTaskByUseCase _getTaskByUseCase;
  final GetTaskUseCase _getTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  TaskBloc(this._createaskUseCase, this._getTaskByUseCase, this._getTaskUseCase, this._updateTaskUseCase, this._deleteTaskUseCase) : super(TaskInitial()) {
    on<OnGetTask>((event, emit) async{
      emit(TaskLoading());
      try {
        final resp =  await _getTaskUseCase();
        emit (TaskListLoaded(taskList: resp));
      }catch (e){
        emit(TaskFailure());
      }
      
    });

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
        emit (TaskSuccess());
      }catch (e){
        emit(TaskFailure());
      }
      
    });

    on<onGetTaskBy>((event, emit) async{
      emit(TaskLoading());
      try {
        final resp = await _getTaskByUseCase(state: event.state);
        emit (TaskListLoaded(taskList: resp));
      }catch (e){
        emit(TaskFailure());
      }
      
    });
  }
}
