void main() {
  int num1 = 10, num2 = 20, num3 = 15;

  int largest = (num1 > num2 && num1 > num3) ? num1 : (num2 > num3 ? num2 : num3);
  int smallest = (num1 < num2 && num1 < num3) ? num1 : (num2 < num3 ? num2 : num3);

  print("Numbers: $num1, $num2, $num3");
  print("Largest number: $largest");
  print("Smallest number: $smallest");
}
/*import 'dart:math';

void main() {
  int num1 = 10, num2 = 20, num3 = 15;

  int largest = max(num1, max(num2, num3));
  int smallest = min(num1, min(num2, num3));

  print("Numbers: $num1, $num2, $num3");
  print("Largest number: $largest");
  print("Smallest number: $smallest");
}*/
