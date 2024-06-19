class Student {
  int id = 0;
  String FirstName = '';
  String LastName = '';
  int grade = 0;
  String _status = '';

  Student(String FirstName, String LastName, int grade) {
    this.FirstName = FirstName;
    this.LastName = LastName;
    this.grade = grade;
  }
  Student.withId(int id, String FirstName, String LastName, int grade) {
    this.id = id;
    this.FirstName = FirstName;
    this.LastName = LastName;
    this.grade = grade;
  }
  String get getFirstName {
    return this.FirstName;
  }

  void set setFirstName(String Value) {
    this.FirstName = Value;
  }

  String get getStatus {
    String message = '';
    if (this.grade >= 60) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Büt";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
