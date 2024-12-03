import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/features/task_list/presentation/bloc/task_bloc.dart';
import 'package:tasks/features/task_list/presentation/widgets/task_bar_widget.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>();

    // Emite el evento cuando se construye la vista
    taskBloc.add(OnGetTask());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        centerTitle: true,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          switch (state) {
            case TaskLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case TaskListLoaded():
              return TaskBarWidget(taskList: state.taskList);

            case TaskFailure():
              return const Center(
                child: Text('Ha ocurrido un error'),
              );
            default:
              return const Center(
                child: Text('No hay tareas disponibles'),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        label: const Text('Crear Tarea'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
