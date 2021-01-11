class Foster{
  String name;
  String age;
  String phone;
  int amountRoommates;
  String homeType;
  bool hasBackyard;
  bool hasOtherPets;

  Foster(name, age, phone, amountRoommates, homeType, hasBackyard, hasOtherPets){
    this.name = name;
    this.age = age;
    this.phone = phone;
    this.amountRoommates = amountRoommates;
    this.homeType = homeType;
    this.hasBackyard = hasBackyard;
    this.hasOtherPets = hasOtherPets;
  }


  toJson(){
    return {
      "name": this.name,
      "age": this.age,
      "phone": this.phone,
      "amountRoommates": this.amountRoommates,
      "homeType": this.homeType,
      "hasBackyard": this.hasBackyard,
      "hasOtherPets": this.hasOtherPets
    };
  }
}