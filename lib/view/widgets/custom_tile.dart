import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:student_database/controller/database_helper.dart';
import 'package:student_database/view/app_colors.dart';
import 'package:student_database/view/screens/view_page.dart';

// ignore: must_be_immutable
class CustomTile extends StatelessWidget {
  DatabaseHelper db = DatabaseHelper();
  int studentId;
  Uint8List? image;
  String firstName;
  String lastName;
  int classNo;
  void Function()? onTap;
  String address;
  int rollNo;
  CustomTile(this.address, this.rollNo, this.studentId, this.firstName,
      this.lastName, this.image, this.classNo, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    image != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage: MemoryImage(image!),
                          )
                        : CircleAvatar(
                            radius: 50,
                            child: Icon(Icons.person),
                          ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name:$firstName',
                          style: ColorsApp.primaryText),
                      Text('Last Name:$lastName', style: ColorsApp.primaryText),
                      Text('Class : $classNo', style: ColorsApp.primaryText),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewPage(
                                          firstName: firstName,
                                          lastName: lastName,
                                          studentId: studentId,
                                          rollNo: rollNo,
                                          classNo: classNo,
                                          address: address,
                                          studentPhoto: image!,
                                        )));
                          },
                          child: Text('View details')),
                      Row(
                        children: [
                          Icon(
                            Icons.edit,
                            size: 15,
                          ),
                          Text(
                            'Click tile to edit',
                            style: ColorsApp.settexttheme(
                                size: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          db.deleteStudentData(studentId);
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
