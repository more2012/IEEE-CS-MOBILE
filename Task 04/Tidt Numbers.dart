import 'dart:io';
bool tidyNumber(int n) {
  String numString= n.toString(); 
  for (int i=0; i < numString.length-1; i++) {
    if (numString[i].compareTo(numString[i + 1]) > 0) {
      return false; 
    }
  }
  return true; 
}