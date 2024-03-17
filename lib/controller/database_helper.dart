import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_database/model/student_model.dart';

ValueNotifier<List<StudentModel>> datalistnotifier = ValueNotifier([]);

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase('studentdata.db');
    return _database!;
  }

  static Future<Database> initDatabase(String s) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, s);
    return await openDatabase(path, version: 1, onCreate: ((db, version) async {
      await db.execute(
          'CREATE TABLE studentdata(studentId INTEGER PRIMARY KEY AUTOINCREMENT,firstName TEXT,lastName TEXT,studentPhoto TEXT,classNumber INTEGER,rollNo INTEGER,address TEXT)');
    }));
  }

//CRUD METHODS
//insert to database
  Future<int> insertData(StudentModel data) async {
    final db = await database;
    // int key=await database.rawInsert('INSERT INTO studentdata(firstName,lastName,studentPhoto,classNumber,rollNo,address)VALUES(?,?,?,?,?,?)',[data.firstName,data.lastName,data.studentPhoto,data.classNumber,data.rollNo,data.address]);
    int key = await db.insert('studentdata', data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(data.firstName);
    getData();
    print('key of inserted data $key');
    return key;
  }

//getting data from database
  getData() async {
    final db = await database;
    final List<Map<String, Object?>> queryResult =
        await db.query('studentdata');
    List<StudentModel> data =
        queryResult.map((e) => StudentModel.fromMap(e)).toList();
    datalistnotifier.value.clear();
    print(data);
    datalistnotifier.value.addAll(data);
    datalistnotifier.notifyListeners();
    print(datalistnotifier.value);
  }

//updating data in database
  updateData(StudentModel data) async {
    final db = await database;
    db.update('studentdata', data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
        where: 'studentId=?',
        whereArgs: [data.studentId]);
    getData();
  }

//deleting student data
  deleteStudentData(int studentId) async {
    final db = await database;
    db.delete('studentdata', where: 'studentId=?', whereArgs: [studentId]);
    getData();
  }
}
