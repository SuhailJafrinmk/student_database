import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:student_database/controller/database_helper.dart';
import 'package:student_database/view/widgets/mytextfield.dart';

class ViewPage extends StatefulWidget {
  final int studentId;
  final String firstName;
  final String lastName;
  final int rollNo;
  final int classNo;
  final String address;
  final Uint8List studentPhoto;

  const ViewPage(
      {super.key,
      required this.studentId,
      required this.firstName,
      required this.lastName,
      required this.rollNo,
      required this.classNo,
      required this.address,
      required this.studentPhoto});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final classController = TextEditingController();
  final rollNoController = TextEditingController();
  final addressController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Uint8List? image;
  File? selectedImage;
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    classController.text = widget.classNo.toString();
    rollNoController.text = widget.rollNo.toString();
    addressController.text = widget.address;
    image = widget.studentPhoto;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit data page'),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    image == null
                        ? CircleAvatar(
                            child: Icon(Icons.person),
                            radius: 50,
                          )
                        : CircleAvatar(
                            radius: 50, backgroundImage: MemoryImage(image!)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'First name',
                  maxline: 1,
                  hintText: 'Enter First Name',
                  controller: firstNameController,
                  textenable: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'Last name',
                  maxline: 1,
                  hintText: 'Enter lastname',
                  controller: lastNameController,
                  textenable: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'Class',
                  maxline: 1,
                  hintText: 'Enter class',
                  controller: classController,
                  textenable: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'Roll no',
                  maxline: 1,
                  hintText: 'Enter Your roll number',
                  controller: rollNoController,
                  textenable: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'Address',
                  maxline: 1,
                  hintText: 'Enter your Address',
                  controller: addressController,
                  textenable: true,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
