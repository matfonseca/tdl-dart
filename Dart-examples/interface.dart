abstract class addables{
  void add(z);
}


class ComplexNumber implements addables{
  int x;
  int y;
  ComplexNumber(int x, int y){
    this.x = x;
    this.y = y;
  }

  void add(z){
    this.x += z.x;
    this.y += z.y;
  }

  String toString(){
    return "${this.x} + i (${this.y})";
  }
}


main(){
  ComplexNumber z1 = ComplexNumber(1 ,2);
  ComplexNumber z2 = ComplexNumber(3, -1);

  print("Z1 is: ${z1}");
  print("Z2 is: ${z2}");


  z1.add(z2);
  print("Z1 + Z2 = ${z1}");
}