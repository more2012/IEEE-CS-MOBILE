import 'dart:io';

void main() {
  stdout.write("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);

  stdout.write("Divisors of $number: ");
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      stdout.write("$i ");
    }
  }
  print("");
}
