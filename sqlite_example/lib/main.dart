import 'package:flutter/material.dart';
import 'package:sqlite_example/db/database.dart';
import 'model/student.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite CRUD example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final _studentNameController = TextEditingController();
  Future <List<Student>>_studentsList;
  String _studentName;
  bool isUpdate = false;
  int studentIdForUpdate;

  @override
  void initState() {
    updateStudentList();
    super.initState();
  }

updateStudentList() {
  setState(() {
    _studentsList = DBProvider.db.getStudents();
  });

}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite CRUD Demo'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formStateKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Student Name';
                      }
                      if (value.trim() == "")
                        return "Only Space is Not Valid!!!";
                      return null;
                    },
                    onSaved: (value) {
                      _studentName = value;
                    },
                    controller: _studentNameController,
                    decoration: InputDecoration(
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.greenAccent,
                            width: 2,
                            style: BorderStyle.solid),
                      ),
                      labelText: "Student Name",
                      icon: Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text(
                  (isUpdate ? 'UPDATE' : 'ADD'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if(isUpdate) {
                    if(_formStateKey.currentState.validate()) {
                      _formStateKey.currentState.save();
                      DBProvider.db.updateStudent(Student(studentIdForUpdate, _studentName))
                      .then((data) {
                        setState(() {
                          isUpdate = false;
                        });
                      });
                    } 
                } else {
                      //добавление нового
                      if(_formStateKey.currentState.validate()) {
                        _formStateKey.currentState.save();
                        DBProvider.db.insertStudent(Student(null, _studentName));
                      }
                    }
                    _studentNameController.text = '';
                    updateStudentList();
                  },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              RaisedButton(
                color: Colors.red,
                child: Text(
                  (isUpdate ? 'CANCEL UPDATE' : 'CLEAR'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _studentNameController.text = '';
                  setState(() {
                    isUpdate = false;
                    studentIdForUpdate = null;
                  });
                },
              ),
            ],
          ),
          const Divider(
            height: 5.0,
          ),
          Expanded(
            child: FutureBuilder(
              future: _studentsList,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return generateList(snapshot.data);
                }
                if(snapshot.data == null || snapshot.data.length == 0) {
                  return Text('No Data Found');
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView generateList(List<Student> students) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('NAME'),
          ),
          DataColumn(
            label: Text('DELETE'),
          ),
        ],
        rows: students.map(
          (student) => DataRow(
            cells: [
              DataCell(
                Text(student.name),
                onTap: () {
                  setState(() {
                    isUpdate = true;
                    studentIdForUpdate = student.id;
                  });
                  _studentNameController.text = student.name;
                }
              ),
              DataCell(
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    DBProvider.db.deleteStudent(student.id);
                    updateStudentList();
                  },
                ),
              ),
            ]
          ),
        ).toList(),
      ),
    ),
  );
}

}