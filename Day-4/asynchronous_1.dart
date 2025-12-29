// Day-4 of learning flutter(dart)
//Asynchronous programming in dart
// server => fetch data -> loading state and ->loaded state
//then()
void main() {
  // First example: delayFirst
  print("First example:");
  print("Program started"); // synchronous, runs immediately
  delayFirst(); // runs asynchronously
  print("Program ended (this runs immediately after calling delayFirst)\n"); // synchronous
  
  // Second example: fetchData
  print("Second example:");
  print("Fetching data from server..."); // synchronous
  fetchData().then((value){  // asynchronous, runs after 3 seconds
   print("Data received: $value");
  });
   print("This runs before data is received\n"); // synchronous
  
  // Third Example
   print("Third example:");
  downloadFiles().then((result) {
    print(result); // This will show the combined result after all downloads
  });

}
//Using Future.delayed
void delayFirst(){
  Future.delayed(Duration(seconds: 2),(){
    print("2 seconds after program ended");
  });
}
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 3), () => "Hello World!\n");
}

Future<String> downloadFiles() async {
  String file1 = await Future.delayed(Duration(seconds:4),() => "File1... (Downloaded in 4 seconds)");
  String file2 = await Future.delayed(Duration(seconds:5),() => "File2... (Downloaded in 5 seconds)");

  return "All files downloaded:\n $file1, $file2"; // Return combined result
} 
//Simply put=> What is supposed to run synchromously runs first as usual, the delayed ones wait and get processed after given time