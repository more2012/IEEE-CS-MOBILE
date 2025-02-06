void main() {
  String numStr = "405.6";
  
  double numDouble = double.parse(numStr);
  int numInt = numDouble.toInt();

  print("Integer: $numInt");
  print("Double: $numDouble");
  
}
