class Dog {

  String name;
  String breed; 
  int age; 
  String size;
  String vaccines;
  String description;
  String imageUri;


  Dog(String name, String breed, int age, String size, String vaccines, String description, String imageUri){
    this.name = name;
    this.breed = breed;
    this.age = age;
    this.size = size;
    this.vaccines = vaccines;
    this.description = description;
    this.imageUri = imageUri;
  }

  setImageUri(uri){
    this.imageUri = uri;
  }

  toJson(){
    return {
      "name": this.name,
      "breed": this.breed,
      "age": this.age,
      "size": this.size,
      "vaccines": this.vaccines,
      "description": this.description,
      "image_uri": this.imageUri
    };
  }
  
}