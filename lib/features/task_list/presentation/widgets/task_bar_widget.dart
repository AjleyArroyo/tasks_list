import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/presentation/bloc/task_bloc.dart';
import 'package:tasks/features/task_list/presentation/widgets/task_widget.dart';

class TaskBarWidget extends StatelessWidget {
  final List<Task> taskList;
  const TaskBarWidget({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    List<Task> taskPending =
        taskList.where((task) => task.state == false).toList();
    List<Task> taskComplete =
        taskList.where((task) => task.state == true).toList();
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TabBar(labelStyle: TextStyle(fontSize: 16), tabs: [
              Tab(
                text: 'Todos',
              ),
              Tab(
                text: 'Pendientes',
              ),
              Tab(
                text: 'Completados',
              )
            ]),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Desliza a la izquierda para eliminar',
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //Para actualizar la lista en caso que sea necesario
                  RefreshIndicator(
                    onRefresh: () async =>
                        BlocProvider.of<TaskBloc>(context).add(OnGetTask()),
                    child: ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return TaskWidget(task: taskList[index]);
                      },
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: () async =>
                        BlocProvider.of<TaskBloc>(context).add(OnGetTask()),
                    child: ListView.builder(
                      itemCount: taskPending.length,
                      itemBuilder: (context, index) {
                        return TaskWidget(task: taskPending[index]);
                      },
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: () async =>
                        BlocProvider.of<TaskBloc>(context).add(OnGetTask()),
                    child: ListView.builder(
                      itemCount: taskComplete.length,
                      itemBuilder: (context, index) {
                        return TaskWidget(task: taskComplete[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
