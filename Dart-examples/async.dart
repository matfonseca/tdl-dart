
// ···
Future<void> printWithDelay(String message, delay) async {
  await Future.delayed(delay);
  print(message);
}


main(){
  const delay = Duration(seconds: 1);
  String message = "Finish future";
  print("before call future fuction");
  printWithDelay(message, delay);
  print("after call future fuction");
}