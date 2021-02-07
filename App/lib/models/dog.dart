class Dog {

  String dogId;
  String name;
  String breed; 
  int age; 
  String size;
  String vaccines;
  String description;
  String imageUri;

  Dog({this.name, this.breed, this.age, this.size, this. vaccines, this.description, this.imageUri, this.dogId});

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