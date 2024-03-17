import 'package:flutter/material.dart';
import 'package:student_database/controller/database_helper.dart';
import 'package:student_database/view/app_colors.dart';
import 'package:student_database/view/screens/adding_page.dart';
import 'package:student_database/view/screens/editing_page.dart';
import 'package:student_database/view/widgets/custom_tile.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  DatabaseHelper databaseHelper = DatabaseHelper();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    databaseHelper.getData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddingPage()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('StudentDatabase',
            style: ColorsApp.settexttheme(
              size: 25,
              fontWeight: FontWeight.w500,
            )),
      ),
      body: ValueListenableBuilder(
          valueListenable: datalistnotifier,
          builder: (BuildContext context, student, child) {
            print(student);
            return ListView.builder(
                itemCount: student.length,
                itemBuilder: (BuildContext context, index) {
                  final data = student[index];
                  return CustomTile(
                      data.address,
                      data.rollNo,
                      data.studentId!,
                      data.firstName,
                      data.lastName,
                      data.studentPhoto,
                      data.classNumber,
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditingPage(
                                  studentId: data.studentId!,
                                  firstName: data.firstName,
                                  lastName: data.lastName,
                                  rollNo: data.rollNo,
                                  classNo: data.classNumber,
                                  address: data.address,
                                  studentPhoto: data.studentPhoto!))));
                });
          }),
    );
  }
}
