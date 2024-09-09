
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:leave_testt/screens/leave_page.dart';
import 'bloc/leave_bloc.dart';
import 'package:dio/dio.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  runApp(MyApp(dio: dio));
}



class MyApp extends StatelessWidget {
  final Dio dio;

  MyApp({required this.dio});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LeaveBloc(),
        ),
      ],
      child: GetMaterialApp(
        home: LeavePage(),
      ),
    );
  }
}
