//Clase para hacer test al TaskBloc

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks/features/task_list/domain/entities/task.dart';
import 'package:tasks/features/task_list/domain/use_cases/create_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/delete_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/get_task.dart';
import 'package:tasks/features/task_list/domain/use_cases/update_task.dart';
import 'package:tasks/features/task_list/presentation/bloc/task_bloc.dart';


// Crea mocks para cada uno de los casos de uso
class MockGetTaskUseCase extends Mock implements GetTaskUseCase {}

class MockCreateTaskUseCase extends Mock implements CreateaskUseCase {
  
}

class MockUpdateTaskUseCase extends Mock implements UpdateTaskUseCase {}

class MockDeleteTaskUseCase extends Mock implements DeleteTaskUseCase {}

void main() {
  group('TaskBloc', () {
    late TaskBloc taskBloc;
    late MockGetTaskUseCase mockGetTaskUseCase;
    late MockCreateTaskUseCase mockCreateTaskUseCase;
    late MockUpdateTaskUseCase mockUpdateTaskUseCase;
    late MockDeleteTaskUseCase mockDeleteTaskUseCase;
    // Configuración antes de cada prueba
    setUp(() {
      mockGetTaskUseCase = MockGetTaskUseCase();
      mockCreateTaskUseCase = MockCreateTaskUseCase();
      mockUpdateTaskUseCase = MockUpdateTaskUseCase();
      mockDeleteTaskUseCase = MockDeleteTaskUseCase();

      taskBloc = TaskBloc(
        mockCreateTaskUseCase,
        mockGetTaskUseCase,
        mockUpdateTaskUseCase,
        mockDeleteTaskUseCase,
      );
    });
    // Limpiar después de cada prueba
    tearDown(() {
      taskBloc.close();
    });

    test('debe iniciar con el estado TaskInitial', () {
      expect(taskBloc.state, isA<TaskInitial>());
    });

    blocTest<TaskBloc, TaskState>(
      'emite [TaskLoading, TaskListLoaded] cuando se carga la lista de tareas',
      build: () {
        // Mockear el comportamiento de GetTaskUseCase
        when(() => mockGetTaskUseCase()).thenAnswer((_) async => [
              Task(
                  name: 'tarea 1',
                  description: 'descripcion tarea 1',
                  state: false),
              Task(
                  name: 'tarea 2',
                  description: 'descripcion tarea 2',
                  state: false),
            ]);
        return taskBloc;
      },
      act: (bloc) => bloc.add(OnGetTask()), // Llamamos al evento
      expect: () => [
        isA<TaskLoading>(), // Matcher que compara el tipo de estado
        isA<TaskListLoaded>() //Estado cuando se cargan las tareas
      ],
    );

    blocTest<TaskBloc, TaskState>(
      'emite [TaskLoading, TaskSuccess] cuando se crea una tarea',
      build: () {
        // Simular la respuesta de CreateTaskUseCase
        when(() => mockCreateTaskUseCase(
              Task(
                  name: 'tarea 1',
                  description: 'descripcion tarea 1',
                  state: false),
            )).thenAnswer((_) async => true);
        return taskBloc;
      },
      act: (bloc) => bloc.add(OnCreateTask(
          task: Task(
              name: 'tarea 1',
              description: 'descripcion tarea 1',
              state: false))), // Evento para crear tarea
      expect: () => [
        isA<TaskLoading>(), // Matcher que compara el tipo de estado
        isA<TaskFailure>(), //Estado cuando se crea la tarea
      ],
    );
  });
}
