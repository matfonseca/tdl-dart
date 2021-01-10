class Dog {

  String name;
  String breed; 
  int age; 
  String size;
  String vaccines;
  String description;

  Dog(String name, String breed, int age, String size, String vaccines, String description){
    this.name = name;
    this.breed = breed;
    this.age = age;
    this.size = size;
    this.vaccines = vaccines;
    this.description = description;
  }

  toJson(){
    return {
      "name": this.name,
      "breed": this.breed,
      "age": this.age,
      "size": this.size,
      "vaccines": this.vaccines,
      "description": this.description
    };
  }
  
}