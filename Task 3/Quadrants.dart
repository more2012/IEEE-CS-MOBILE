import 'dart:io';
int quadrant(int x,int y) {
  if (x>0 && y>0) return 1; 
  if (x<0 && y>0) return 2; 
  if (x<0 && y<0) return 3; 
  return 4;
}
void main() {
  print("Enter X coordinate:");
  int x = int.parse(stdin.readLineSync()!);
  print("Enter Y coordinate:");
  int y = int.parse(stdin.readLineSync()!); 
  print("The point ($x, $y) is in quadrant: ${quadrant(x, y)}");
}