import 'dart:convert';
import 'dart:math';

class Student {
  String name = '';
  int kor = 0;
  int eng = 0;
  int math = 0;
  double avg = 0.0;

  Student() {
    kor = Random().nextInt(99) + 1;
    eng = Random().nextInt(99) + 1;
    math = Random().nextInt(99) + 1;
  }
}

void main() {
  List<Student> aList = [];

  for (int i = 0; i < 5; i++) {
    Student a = Student();
    a.name = AsciiCodec().decode([65 + i]);
    aList.add(a);
  }

  print("이름, 국어, 영어, 수학, 평균");

  for (int i = 0; i < aList.length; i++) {
    double avg = (aList[i].kor + aList[i].eng + aList[i].math) / 3.0;
    aList[i].avg = avg;
    print(
        '${aList[i].name}, ${aList[i].kor}, ${aList[i].eng}, ${aList[i].math}, ${aList[i].avg.toStringAsFixed(2)}');
  }

  print('평균으로 정렬');

  List<Student> newList = List.from(aList);
  newList.sort((a, b) => a.avg.compareTo(b.avg));

  for (var student in newList) {
    print(
        '${student.name}, ${student.kor}, ${student.eng}, ${student.math}, ${student.avg.toStringAsFixed(2)}');
  }
}
