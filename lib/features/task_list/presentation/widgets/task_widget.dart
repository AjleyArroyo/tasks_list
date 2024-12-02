import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/presentation/bloc/task_bloc.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  
  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      
      key: Key(task.id!),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => BlocProvider.of<TaskBloc>(context).add(OnDeleteTask(id: task.id!)),
      background: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.red),
              
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Icon(
                Icons.delete, 
                color: Colors.white,
                size: 30,
              ),
            ),
      child: Card(
      
        margin: const EdgeInsets.all(16),
        elevation: 4,
        
        shadowColor: Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.name, style: const TextStyle(fontSize: 22),),
                  const SizedBox(height: 4,),
                  Text(task.description)
                ],
              ),
              Transform.scale(
                scale: 1.6,
                child: Checkbox( value: task.state, onChanged: (value) {
                  BlocProvider.of<TaskBloc>(context).add(OnEditTask(id: task.id!, state: value!));
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}