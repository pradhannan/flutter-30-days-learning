// Day 2 of learning Flutter (Dart basics)

void main(){
  // Conditional Statements
  
  // 1. If statement
  int age=23;
  if (age>18){
    print("You're $age years old! You are eligible for voting!");
  }
  
   // 2. If else statement
  int num=18;
  if (num%2==0){
    print("$num is an even number");
  }
  else{
    print("$num is a odd number");
  }
  
   // 3. Else if statement
  int marks=49;
  if (marks<40){
    print("Oops Fail :< only $marks");
  }
  else if(marks<90){
    print("Pass :) with $marks");
  }
  else{
    print("90+ secured! Secured $marks :))"); // Added missing 'print'
  }
  
  // 4. Switch Case
  switch(marks){
    case 40:
      print("Call it luck!");
      break;
    case 90:
      print("Just a little more effort");
      break;
    case 100:
      print("Just incredible!!");
      break;
    default:
      print("Keep working hard!");
  }
  
  // Loops
  
  // 1. for loop
  int userNumber=5;
  print("For loop:");
  for(int i=1;i<=userNumber;i++){
    print(i);
  }
  
  // 2. while loop
  int userNumber1=5, i=1;
  print("While loop:");  
  while(i <= userNumber){
    userNumber1=userNumber1+i;
    print(userNumber1);
    i++;
  }
  
  //3. Do while loop
  int j=0;
  print("Do while loop:");
  do{
    print(2 * j);
    j++;
  }while(j<userNumber);
}