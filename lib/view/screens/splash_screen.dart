// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:student_database/view/app_colors.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {

//      });

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsApp.secondaryColor,
//       body: Center(
//         child: Image.asset('assets/images/logostudentdb.png',height: MediaQuery.of(context).size.height*.5,width: MediaQuery.of(context).size.width*.5,),
//       ),
//     );
//   }
// }
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:student_database/view/app_colors.dart';
import 'package:student_database/view/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      useImmersiveMode: true,
      backgroundColor: ColorsApp.primaryColor,
      childWidget:
          Center(child: Image.asset('assets/images/logostudentdb.png')),
      duration: Duration(seconds: 3),
      nextScreen: HomeScreen(),
    );
  }
}
