import 'dart:io';
int squareSum(List<int>numbers) {
  int sum=0;
  for (int number in numbers) {
    sum += number*number;
  }
  return sum;
}
void main() {
  print('Enter the 3 numbers');
  String input= stdin.readLineSync()!; 
  List<int> numbers= input.split(' ').map((str)=> int.parse(str)).toList(); 
  int result= squareSum(numbers); 
  print('The Sum is $result');
}