import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/students_add.dart';
import 'models/student.dart';

String mesaj1 = "Öğrenci Bilgi Sistemi";
Student selectedStudent = Student.withId(0, "", "", 0);

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Student> students = [
    Student.withId(1, "Nisanur", "Işık", 87),
    Student.withId(2, "Sam", "Port", 35),
    Student.withId(3, "Tom", "Clock", 47)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj1),
        ),
        body: buildBody(context));
  }

  String sinavHesapla(int puan) {
    if (puan >= 50) {
      return "Geçtiniz";
    } else if (puan >= 30) {
      return "Büte giriniz";
    } else {
      return "Kaldınız";
    }
  }

  void goster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2024/05/23/13/23/moorente-8783210_1280.jpg"),
                      ),
                      title: Text(students[index].FirstName +
                          " " +
                          students[index].LastName),
                      subtitle: Text("Sınavdan alınan not : " +
                          students[index].grade.toString() +
                          " [" +
                          students[index].getStatus +
                          "]"),
                      trailing: buildIcon(students[index].grade),
                      onTap: () {
                        setState(() {
                          selectedStudent = students[index];
                        });
                      });
                })),
        Text("Seçilen Öğrenci : " +
            selectedStudent.FirstName +
            " " +
            selectedStudent.LastName),
        Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    var mesaj = "Başarıyla silindi -> " +
                        selectedStudent.FirstName +
                        ' ' +
                        selectedStudent.LastName;
                    goster(context, mesaj);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Sil"),
                    ],
                  ),
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Text("Boş düğme");
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.ads_click),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Tıkla"),
                    ],
                  ),
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentAdd()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Ekle"),
                    ],
                  ),
                ))
          ],
        ),
      ],
    );
  }

  Widget buildIcon(int grade) {
    if (grade >= 60) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
