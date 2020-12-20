List<int> createIntegersArrayWithFor(n){
  List<int> array = new List();
  for (var i = 0; i < n; i++) {
    array.add(i);
  }
  return array;
}

List<int> createIntegersArrayWithWhile(n){
  List<int> array = new List();
  var i = 0;
  while (i < n) {
      array.add(i); 
      i++; 
  }
  return array;
}

main(){
  List<int> array1 = createIntegersArrayWithFor(10);
  print("${array1}");

  List<int> array2 = createIntegersArrayWithWhile(15);
  print("${array2}");
}