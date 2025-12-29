// Day 4 of learning Flutter(dart)

// try-catch,on-keyword,finally keyword,stackTrace,custom option

void main(){
  //Example 1 using only try catch
  try{
      Map<String, String> fruits = {
    "apple": "red",
    "banana": "yellow",
    "grape": "purple"
  };
    print("Getting color of orange...");
    // This will throw an exception because key is missing
    print("Color: ${fruits["orange"]}");
  }   catch(e){
    print("The error is $e"); // catches any exception
  }
  finally {
    print("Finally block executed after first try-catch\n"); //It will be executed anyway
  }
  
   // Example 2: Using try-on-catch with specific exception
  try {
    print("Attempting unsupported operation...");
    int result=10~/0;
    print(result);
} on UnsupportedError catch (e){
    print("Caught a UnsupportedError: $e");
    print("Cannot divide by ZERO!\n");
  }
  
  //Example no 3 with custom exception
  try{
    print("Attemplting custom exception using throw....");
    checkAge(9);
  }catch(e){
    print(e);
  }
  
  
  //Example no 4 with stackTrace 

  try {
    List<int> numbers = [1, 2, 3];
    print("Attempting to access 5th index which doen't exist...");
    print(numbers[5]);   //will throw exception
  }

    catch (e, stackTrace) {
    print("Caught an exception: $e");
    print("Stack trace:\n$stackTrace");
  } 
}

void checkAge(int age){
  if(age<18){
    throw Exception("For voting, age must be greater than 18!! \n");
  }
}