class Student   {
  int id;
  String name;

  Student(this.id, this.name);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;

    return map;
  }

  Student.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
  }
}
