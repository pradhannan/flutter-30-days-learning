/// Day 1 of learning Flutter (Dart basics)

void main(){
/// Variables
  String studentName ="Pradhan";  ///datatype variable_name
  int studentAge =19;
  String studentSubject = "Flutter learning";
  
  /// Class object creation
  Student s1= Student(studentName, studentAge, studentSubject);
  
  ///Calling function
  s1.studentDetails();
}


/// Student Class
class Student {
  String name;  /// Class members
  int age;
  String subject;
  
  
  /// Constructor 
  Student(this.name,this.age,this.subject);  
  
  void studentDetails(){
    print("Name: $name");
    print("Age: $age");
    print("Subject: $subject");
  }
}