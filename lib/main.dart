import 'package:flutter/material.dart';
import 'package:student_database/controller/database_helper.dart';
import 'package:student_database/view/screens/splash_screen.dart';
import 'package:student_database/view/theme/themes.dart';

void main()async{
  DatabaseHelper db=DatabaseHelper();
  WidgetsFlutterBinding.ensureInitialized();
  await db.database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
    theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}