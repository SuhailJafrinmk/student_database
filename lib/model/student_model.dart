import 'dart:typed_data';

class StudentModel{
  int ? studentId;
  String firstName;
  String lastName;
  Uint8List? studentPhoto;
  int classNumber;
  int rollNo;
  String address;


 
  
  StudentModel({
  this.studentId,
  required this.firstName,
  required this.lastName,
  required this.studentPhoto,
  required this.classNumber,
  required this.rollNo,
  required this.address,
  });

  factory StudentModel.fromMap(Map <String,dynamic> data){
    return StudentModel(
   studentId: data['studentId'],
   firstName: data['firstName'],
   lastName: data['lastName'],
   studentPhoto: data['studentPhoto'],
   classNumber: data['classNumber'],
   rollNo: data['rollNo'],
   address: data['address'],
    );
  }

  Map <String,dynamic> toMap()=>{
    'studentId':studentId,
    'firstname':firstName,
    'lastName':lastName,
    'studentPhoto':studentPhoto,
    'classNumber':classNumber,
    'rollNo':rollNo,
    'address':address,
  };

}