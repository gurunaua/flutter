class Schedule {
  int id;
  DateTime start;
  DateTime end;
  Subject subject;
  Teacher teacher;

  Schedule(this.id, this.start, this.end, this.subject, this.teacher);
}

class Teacher {
  int id;
  String name;
  List<Subject> subjects;

  Teacher({this.id, this.name, this.subjects});
}

class Subject {
  int id;
  String name;

  Subject({this.id, this.name});
}

final Subject subject = Subject(id: 1, name: "Math");
final Subject subject2 = Subject(id: 2, name: "Bahasa");
final Subject subject3 = Subject(id: 1, name: "Biology");
final Subject subject4 = Subject(id: 1, name: "Physic");

List<Subject> list1 = [subject, subject2];
List<Subject> list2 = [subject3, subject2];
List<Subject> list3 = [subject4];

final Teacher teacher = Teacher(id: 1, name: "Susan", subjects: list1);
final Teacher teacher2 = Teacher(id: 2, name: "Susan2", subjects: list2);
final Teacher teacher3 = Teacher(id: 3, name: "Susan3", subjects: list3);
final Teacher teacher4 = Teacher(id: 4, name: "Susan4", subjects: list1);
final Teacher teacher5 = Teacher(id: 5, name: "Susan5", subjects: list2);

List<Teacher> teachers = [teacher, teacher2, teacher3, teacher4, teacher5];

DateTime now = DateTime.now();
var currentTime = new DateTime(now.year, now.month, now.day, now.hour, now.minute);
Schedule schedule = Schedule(1, currentTime, currentTime, subject, teacher);
Schedule schedule2 = Schedule(2, currentTime, currentTime, subject, teacher);
Schedule schedule3 = Schedule(3, currentTime, currentTime, subject, teacher);
Schedule schedule4 = Schedule(4, currentTime, currentTime, subject, teacher);
