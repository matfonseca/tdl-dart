abstract class Vehicle{
  int max_speed;
  int size;
  String color;
  String brand;
  bool running = false;

  void run();
  void stop();
}

abstract class Product{
  double price;
  String currency_type;
}

class Car extends Vehicle with Product{
  double size_tank;
  double fuel_quantity = 0.0;
  
  Car(int max_speed, int size, String color, String brand, double size_tank, double price, String currency_type){
    this.max_speed = max_speed;
    this.size = size;
    this. color = color;
    this.brand = brand;
    this.size_tank = size_tank;
    this.price = price;
    this.currency_type = currency_type;
  }

  loadFuel(double amount){
    this.fuel_quantity = amount;
  } 

  isRunning(){
    return this.running;
  }

  double getFuelQuantity(){
    return this.fuel_quantity;
  }

  void run(){
    if (this.fuel_quantity > 0){
      this.running = true;
    }else{
      this.running = false;
    }
  }

  void stop(){
    if(this.running){
      this.running = false;
    }else{
      throw CarNotRunningError();
    }
  }
}



class CarNotRunningError implements Exception{
  @override
  String toString(){
    return "Error: The car is not running";
  }
}



main(){
  Car car = Car(200, 50, "Red", "Jeep", 45.0, 500000, "Pesos ARG");

  print("The car price is ${car.price} ${car.currency_type}");

  print("Car fuel quantity is: ${car.getFuelQuantity()}");
  
  car.loadFuel(5.0);
  print("load 5 liters of fuel");

  print("Car fuel quantity is: ${car.getFuelQuantity()}");

  print("Car is running: ${car.isRunning()}");
  
  car.run();
  print("start car");
  
  print("Car is running: ${car.isRunning()}");


  car.stop();
  print("stop car");

  print("Car is running: ${car.isRunning()}");

  try{
    car.stop();
    print("stop car again");

  }on CarNotRunningError catch(e){
    print(e);
  }

}
