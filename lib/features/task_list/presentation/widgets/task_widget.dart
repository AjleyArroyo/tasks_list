import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/presentation/bloc/task_bloc.dart';
import 'package:tasks/features/task_list/presentation/widgets/custom_checkbox_widget.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id!),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) =>
          BlocProvider.of<TaskBloc>(context).add(OnDeleteTask(id: task.id!)),
      background: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.red),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        shadowColor: Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomCheckbox(
                initialValue: task.state,
                onChanged: (value) {
                  BlocProvider.of<TaskBloc>(context)
                      .add(OnEditTask(id: task.id!, state: value));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  width: 6,
                  decoration: BoxDecoration(
                    color: task.state ? Colors.green : Colors.pink,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: task.state
                            ? Colors.green.withOpacity(0.5)
                            : Colors.pink.withOpacity(0.5), // Sombra.
                        blurRadius: 6, // Suavidad de la sombra.
                        offset:
                            const Offset(2, 0), // Desplazamiento de la sombra.
                      ),
                    ],
                  ),
                  height: 86,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.name,
                        style: const TextStyle(fontSize: 26),
                        
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(task.description, style: const TextStyle(fontSize: 14, color: Colors.grey),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
