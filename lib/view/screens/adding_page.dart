import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_database/controller/database_helper.dart';
import 'package:student_database/model/student_model.dart';
import 'package:student_database/view/widgets/mytextfield.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final classController = TextEditingController();
  final rollNoController = TextEditingController();
  final addressController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Uint8List? image;
  File? selectedImage;
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> pickImage() async {
    final pickimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickimage == null) return;
    setState(() {
      selectedImage = File(pickimage.path);
      image = File(pickimage.path).readAsBytesSync();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add data pagge'),
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
                    IconButton(
                        onPressed: () async {
                          await pickImage();
                        },
                        icon: const Icon(
                          Icons.add,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'First name',
                  maxline: 1,
                  validator: (value) {
                    final regex = RegExp(r'^[a-zA-ZÀ-ÖØ-öø-ÿ]+$');
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be blank';
                    }
                    if (!regex.hasMatch(value)) {
                      return 'Enter valid name';
                    }
                    return null;
                  },
                  hintText: 'Enter First Name',
                  controller: firstNameController,
                  textenable: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'Last name',
                  maxline: 1,
                  hintText: 'Enter lastname',
                  controller: lastNameController,
                  validator: (value) {
                    final regex = RegExp(r'^[a-zA-ZÀ-ÖØ-öø-ÿ]+$');
                    if (value == null || value.isEmpty) {
                      return 'last name cannot be blank';
                    }
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid name';
                    }
                    return null;
                  },
                  textenable: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'Class',
                  maxline: 1,
                  hintText: 'Enter class',
                  controller: classController,
                  textenable: false,
                  validator: (value) {
                    final regex = RegExp(r'^(?:[0-9]|1[0-2])$');
                    if (value == null || value.isEmpty) {
                      return 'enter your class';
                    }
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid class';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'Roll No',
                  maxline: 1,
                  hintText: 'Enter Your roll number',
                  controller: rollNoController,
                  textenable: false,
                  validator: (value) {
                    final regex = RegExp(r'^\d+$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid input';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  label: 'Address',
                  maxline: 1,
                  hintText: 'Enter your Address',
                  controller: addressController,
                  textenable: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address Cannot be blank';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState?.validate() == true) {
                        // final data=StudentModel(firstName: firstNameController.text, lastName: lastNameController.text, classNumber: int.parse(classController.text), rollNo: int.parse(rollNoController.text), address: addressController.text,studentPhoto: _image);
                        addstudentbuttonclick();
                        print('the value is submitted');
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please Enter proper data'),
                          backgroundColor: Colors.red.shade200,
                        ));
                      }
                    },
                    child: const Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addstudentbuttonclick() async {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final classNo = classController.text.trim();
    final rollNo = rollNoController.text.trim();
    final address = addressController.text.trim();
    final studentPhoto = image;

    final student = StudentModel(
        firstName: firstName,
        lastName: lastName,
        classNumber: int.parse(classNo),
        rollNo: int.parse(rollNo),
        address: address,
        studentPhoto: studentPhoto);
    await databaseHelper.insertData(student);
  }
}
