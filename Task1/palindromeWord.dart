import 'dart:io';

void main() {
  stdout.write("Enter a string: ");
String? input = stdin.readLineSync()!;
String cleanedInput = input.replaceAll(" ", "").toLowerCase();
String reversedInput = cleanedInput.split('').reversed.join('');

  if (cleanedInput == reversedInput) {
    print("$input is a palindrome");
  } else {
    print("$input is not a palindrome");
  }
}
