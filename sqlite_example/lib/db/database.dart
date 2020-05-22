import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_example/model/student.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;
  String studentsTable = 'Students';
  String columnId = 'id';
  String columnName = 'name';

  get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'Student.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $studentsTable($columnId INTERGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT)',
    );
  }

  //READ
  Future<List<Student>> getStudents() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> studentsMapList =
        await db.query(studentsTable);
    final List<Student> studentsList = [];
    studentsMapList.forEach((studentMap) {
      studentsList.add(Student.fromMap(studentMap));
    });

    return studentsList;
  }

  //INSERT
  Future<Student> insertStudent(Student student) async {
    Database db = await this.database;
    student.id =
        await db.insert(this.studentsTable, student.toMap()); //????????????
    return student;
  }

  //UPDATE
  Future<int> updateStudent(Student student) async {
    Database db = await this.database;
    return await db.update(
      this.studentsTable,
      student.toMap(),
      where: '$columnId = ?',
      whereArgs: [student.id],
    );
  }

  Future<int> deleteStudent(int id) async {
    Database db = await this.database;
    return await db.delete(this.studentsTable, where: '$columnId = ?', whereArgs: [id]);
  }

}
