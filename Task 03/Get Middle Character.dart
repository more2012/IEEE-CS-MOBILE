import 'dart:io';
String getMiddle(String s) {
  int length= s.length;
  int middle = length ~/2;
 if (length%2 ==0) {
    return s.substring(middle-1, middle+1);
  } else {
    return s[middle];
  }
}
void main() {
  print('Enter Word:');
  String input= stdin.readLineSync() ?? '';
  if(input.isEmpty){
    print('Please, Enter Word');
  } else{
    String middle= getMiddle(input);
    print('the middle is: $middle');
  }
}