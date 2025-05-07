import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raintor_assessment_giasuddin/presentation/blocs/home/home_bloc.dart';
import 'package:raintor_assessment_giasuddin/presentation/views/home_screen.dart';

import 'constant/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeBloc>(create: (_)=>sl<HomeBloc>())
    ], child: MaterialApp(
      title: 'Realtime Tracking System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: HomeScreen(),
    ));
  }
}

