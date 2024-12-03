import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/presentation/bloc/task_bloc.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear tarea'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nombre',
              ),
              TextFormField(
                controller: _nameController,
                maxLength: 30,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "El campo no puede estar vacio";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              const Text('Descripción'),
              TextFormField(
                controller: _descriptionController,
                maxLength: 50,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "El campo no puede estar vacio";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Bordes redondeados
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<TaskBloc>(context).add(OnCreateTask(
                            task: Task(
                                name: _nameController.text,
                                description: _descriptionController.text,
                                state: false)));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Guardar',
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
