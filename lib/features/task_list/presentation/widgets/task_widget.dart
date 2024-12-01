import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/config/service_locator.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/presentation/bloc/task_bloc.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  
  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Text(task.name),
              Text(task.description)
            ],
          ),
          Container(
            child: Checkbox(value: task.state, onChanged: (value) {
              BlocProvider.of<TaskBloc>(context).add(OnEditTask(id: task.id, state: value!));
            },),
          )
        ],
      ),
    );
  }
}