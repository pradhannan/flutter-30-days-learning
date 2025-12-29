// Day-4 of learning flutter(dart)
//Asynchronous programming in dart
// server => fetch data -> loading state and ->loaded state
//async/await
//Stream

void main() async {
  print("Fetching data...");

  // Using async/await to fetch data
  String data = await fetchData();
  print("Data received: $data \n");  // Prints data after 3 seconds
  
  
  
  print("Fetching multiple pieces of data...");

  // Use async/await for multiple tasks in sequence, parallel way
  var results=await Future.wait([
      fetchData1(),
      fetchData2(),
      fetchData3(),
    ]);
  print("All data received together $results \n");   // Prints all results at once when all the data fetching is complete
  
  //Multiple value over time
  await for(int value in counterValue()){
    print("Stream is returning the value one by one");
    print(value);  //prints each value as it arrives from stream
  }
}
// Simple async function simulating data fetching
Future<String> fetchData() async {
  // Delay 
  await Future.delayed(Duration(seconds: 3));
  return "Hello there!"; // Return data after delay
}

Future<String> fetchData1() async {
  await Future.delayed(Duration(seconds: 2));
  return "1st data fetched";
}

Future<String> fetchData2() async {
  await Future.delayed(Duration(seconds: 3));
  return "2nd data fetched";
} 

Future<String> fetchData3() async {
  await Future.delayed(Duration(seconds: 4));
  return "3rd data fetched";
} 

Stream<int> counterValue() async*{
  for (int i=1;i<=5;i++){
    await Future.delayed(Duration(seconds:2)); //omits one value per 2 second
    yield i;
  }
}

  