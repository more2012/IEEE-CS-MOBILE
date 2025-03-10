import 'dart:io';
int descendingOrder(int number) {
List<String> digits = number.toString().split('');
digits.sort((a, b) => b.compareTo(a));
  return int.parse(digits.join());
}
void main() {
  print("Enter a number:");
  int number = int.parse(stdin.readLineSync()!); 
  print("Number after sorting: ${descendingOrder(number)}");
}