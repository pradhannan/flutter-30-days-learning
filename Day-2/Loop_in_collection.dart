// Day 2 of learning Flutter (Dart basics)

void main(){
  List<String> places =["Florida","Orlando","California","LA","Texas"];
  for (var place in places){
    print(place);
  }
  
  print("------------------------------");
  for (var place in places){
  print(place);
  if(place=='California') break;
  }
  
  print("------------------------------");
  places.forEach((place) {
  print(place);
  });
}