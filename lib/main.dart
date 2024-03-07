import 'package:assignment_infosysta/View/Screens/Home/HomePage.dart';
import 'package:assignment_infosysta/View/Screens/Home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeBloc(),)],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        theme:
            ThemeData(fontFamily: 'Cairo',
             scaffoldBackgroundColor: Colors.black,
             primaryColor: Colors.white
             ),
        home: const HomePage(),
      ),
    );
  }
}

