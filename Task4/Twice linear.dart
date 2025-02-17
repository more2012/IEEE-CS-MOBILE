import 'dart:io';
int dblLinear(int n) {
  Set<int> seen = Set<int>();
  List<int> queue = [];

  queue.add(1);
  seen.add(1);
  int current = 0;

  for (int i=0; i<=n; i++) {
    current= queue.removeAt(0); 
    int next1= 2*current +1;
    int next2= 3*current +1;
    if (seen.add(next1)) queue.add(next1);
    if (seen.add(next2)) queue.add(next2);
    queue.sort();
  }
  return current;
}

void main() {
  stdout.write("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);
  int result = dblLinear(n);
  print("dblLinear($n) = $result");
}
