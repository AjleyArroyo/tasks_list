import 'package:flutter/material.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/presentation/widgets/task_widget.dart';

class TaskBarWidget extends StatefulWidget {
  final List<Task> taskList;
  const TaskBarWidget({super.key, required this.taskList});

  @override
  State<TaskBarWidget> createState() => _TaskBarWidgetState();
}

class _TaskBarWidgetState extends State<TaskBarWidget> {
  @override
  Widget build(BuildContext context) {
    List<Task> taskPending = widget.taskList.where((task) => task.state == false).toList();
    List<Task> taskComplete = widget.taskList.where((task) => task.state == true).toList();
    return DefaultTabController(
      initialIndex: 0,
    
      length: 3, child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TabBar(labelStyle: TextStyle(fontSize: 16), tabs: [Tab(text: 'Todos',),Tab(text: 'Pendientes',),Tab(text: 'Completados',)]),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Desliza a la izquierda para eliminar', textAlign: TextAlign.left,),
          ),
          Expanded(
            child: TabBarView(children: [
              ListView.builder(
                itemCount: widget.taskList.length,
                itemBuilder: (context, index) {
                
                return TaskWidget(task: widget.taskList[index]);
              },),
              
            
            ListView.builder(
                itemCount: taskPending.length,
                itemBuilder: (context, index) {
                
                return TaskWidget(task: taskPending[index]);
              },), ListView.builder(
                itemCount: taskComplete.length,
                itemBuilder: (context, index) {
                
                return TaskWidget(task: taskComplete[index]);
              },),],),
          ),
          
          
         
        ],
      ));
  }
}