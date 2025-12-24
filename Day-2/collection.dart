// Day 2 of learning Flutter (Dart basics)

void main(){  
  // Collection
  // 1. List
  
  //Delaration
  List<int>number=[1,2,3,4,5];
  print("List: $number");
  
  //Accessing the list
  print("Number at index 2: ${number[2]}");
  print("Number at first: ${number.first}");
  print("Number at last: ${number.last}");  
  print("Length of the list: ${number.length}");
  
  //Add or Remove
  number.add(5);
  print("Added one value: $number");
  number.addAll([7,8,9,10]);
  print("Added multiple value: $number");
  number.remove(7);
  print("Removed using value: $number");
  number.removeAt(5);
  print("Removed using index: $number");

  //Some list operations
  //Map() -> Transformer
  var data=number.map((n)=>n+5).toList();
  print("New List: $data");
  
  //where()-> Filtering
  var evenData=number.where((n)=>n%2==0).toList();
  print("List of even numbers: $evenData");
  
  //reduce()
  var sum=number.reduce((a,b)=>a+b);
  print("Sum of the list $number = $sum");
  
  //sort()
  List<int> num=[2,45,32,45,62];
  print("List: $num");
  num.sort();
  print("Ascending order: $num");
  num.sort((a,b)=>b.compareTo(a)); //depands upon the positioning of (a,b), a,b compare b to a and if it is greater put it ahead and b,a compare b to a ie first value with second value and if it is smaller put it ahead, simply put if (x,y)=> do x compare to y for ascending and do y compare to x for descending
  print("Descending order: $num");
  
  //List to set
  
  print("List as Set: ${number.toSet()}");

print("------------------------------------");

  // 2. Set
  //Declaration
  Set<int> u={1,2,3,4,5,6,7,8,9,10};
  Set<int> a={1,7,9};
  Set<int> b={2,3,5,7};
  
  print("Set U= $u");
  print("Set A= $a");
  print("Set B= $b");
  
  //functions just like list but omits same value
  a.add(7);
  print("Adding same element again: $a");
  
  a.remove(9);
  print("Removing an element: $a");
  a.addAll({3,5,9});
  print("Adding multiple elements: $a");
  
  var dataSet=a.map((n)=>n^2).toSet();
  print("New Set: $dataSet");
  
  //Advance Operations
  print("Union of set A and B= ${a.union(b)}");
  print("Intersection of set A and B= ${a.intersection(b)}");
  print("Difference of set U and A= ${u.difference(a)}");
  print("Checking if Set A contains an element: ${a.contains(1)}");
  
print("------------------------------------");
  // 3. Map
  Map<String,dynamic> user={
    "name":"Peaches",
    "age":20,
    
  };
  
  //Accessing 
  print("Here's an example of Map: $user");
  print("The name of the user is: ${user["name"]}");
  print("The age of the user is: ${user["age"]}");
  
  //Operations
  user["address"]="Florida";
  print("Adding address: $user");
  user["age"]=25;
  print("Changing age:$user");  

}