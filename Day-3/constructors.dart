// Day 3 of learning Flutter (Dart basics)
// Classes
// Principle of cless -> Inheritance, abstrct class, polymorphism, encapsulation
// Contsructor ->special methods
//Default, Named, Factory and Const Constructors

void main(){
  var car1 = Car("Toyota", 2022);
  print("Default Constructor: ${car1.carname}, Year: ${car1.yearofmanufacture}");
  
  var car2 = Car.usedCar("Honda", 2015);
  print("Named Constructor: ${car2.carname}, Year: ${car2.yearofmanufacture}, Condition: ${car2.condition}");
  
   var car3 = CarFactory.createCar("Tesla");
  print("Factory Constructor: ${car3.name}, Year: ${car3.year}");
  
   var car4 = ImmutableCar("BMW", 2021);
   var car5 = ImmutableCar("BMW", 2021);
  
   print("Const Constructor: ${car4.name}, Year: ${car4.year}");
   print("Are car4 and car5 identical? ${identical(car4, car5)}");
  
}
class Car{
  String carname;
  int yearofmanufacture;
  
  String ?condition;
  
  //Default constructor
  Car(this.carname,this.yearofmanufacture);
  
  // Named constructor
  // Allows to create objects in a different way
  // Here we use it to create a used car
  Car.usedCar(this.carname, this.yearofmanufacture) {
    condition = "Used"; 
  }
}

//Factory constructor single instance
class CarFactory {
  String name;
  int year;

  // Private constructor (only accessible inside the class)
  CarFactory._internal(this.name, this.year);

  // Factory constructor
  // Can decide which object to return, or add logic
  factory CarFactory.createCar(String type) {
    if (type == "Tesla") {
      // Return a specific Tesla car
      return CarFactory._internal("Tesla Model 3", 2022);
    } else {
      // Return a generic car
      return CarFactory._internal("Generic Car", 2020);
    }
  }
}

// Const constructor
// Creates compile time constant objects
class ImmutableCar {
  final String name; // final means it cannot be changed after initialization
  final int year;

  const ImmutableCar(this.name, this.year);
}