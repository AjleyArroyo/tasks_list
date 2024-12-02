import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks/config/service_locator.dart';
import 'package:tasks/features/task_list/presentation/bloc/task_bloc.dart';
import 'package:tasks/features/task_list/presentation/pages/create_task.dart';
import 'package:tasks/features/task_list/presentation/pages/task_list_page.dart';
import 'config/firebase_config/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  ServiceLocatorInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<TaskBloc>())
      ],
      child: MaterialApp(
        title: 'Task List',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18.0), // Tamaño de texto para párrafos grandes
      bodyMedium: TextStyle(fontSize: 16.0), // Tamaño de texto para párrafos medios
      bodySmall: TextStyle(fontSize: 14.0), // Tamaño de texto para párrafos pequeños
      headlineMedium: TextStyle(fontSize: 24.0), // Tamaño para encabezados medios
      headlineSmall: TextStyle(fontSize: 20.0), // Tamaño para encabezados pequeños
      titleLarge: TextStyle(fontSize: 22.0), // Tamaño para títulos
    ),
          useMaterial3: true,
        ),
        
        initialRoute: '/',
        routes: {
          '/': (context) => const TaskListPage(),
          '/create': (context) => CreateTask()
        },
        
      ),
    );
  }
}


