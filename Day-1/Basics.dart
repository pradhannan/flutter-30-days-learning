/// Day 1 of learning Flutter (Dart basics)

void main(){
/// Variables
  // 1. General Datatypes
  String userName = "Pradhan";
  int activeDays = 19;
  int totalDays=30;
  double hoursstudied = 20.7;
  bool isActive = true;

  // 2. Special Datatypes
  dynamic practiceTime = "Evening";
  var subjectTopic = "Dart basics";
  const uid = 1102;
  final dateTime = DateTime.now(); 
  
  greetUser(userName, totalDays);
  int rdays=remainingDays(activeDays,totalDays);
  print("Course Topic: $subjectTopic");
  print("Active days: $activeDays     Remaining days: $rdays");
  userInfo(hoursstudied);
  print("User's ususal practice time: $practiceTime ");
  practiceTime= 7;
  print("User's practice time: $practiceTime pm");
  userInfo2(id: uid,active: isActive,time: dateTime);
}

  /// Function with parameters
  void greetUser(String name, int days){
    print("Username: $name     Total days: $days");
  }
  
  // Function with return value 
  int remainingDays(int days, int tdays){
    return tdays-days;
  }
  // both the above functions have two parameters which are positional parameters
  
  /// Optional Parameter
  void userInfo(double sthours,[bool?active]){
    print("User's total study hours: $sthours hours \nUser status: $active");
  }
  
/// Named Parameter
void userInfo2({required int id,bool?active, required DateTime time}){
  print("User Id: $id   User status: $active \n$time");
}

