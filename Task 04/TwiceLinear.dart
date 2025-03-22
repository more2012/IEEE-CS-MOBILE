import 'dartcollection';
import 'dartio';

int dblLinear(int n) {
  Queueint q2 = Queueint();
  Queueint q3 = Queueint();
  Setint seen = {1};  Track unique values
  int current = 1;

  for (int i = 0; i  n; i++) {
    int next2 = 2  current + 1;
    int next3 = 3  current + 1;

    if (seen.add(next2)) q2.add(next2);
    if (seen.add(next3)) q3.add(next3);

    if (q2.isNotEmpty && (q3.isEmpty  q2.first  q3.first)) {
      current = q2.removeFirst();
    } else {
      current = q3.removeFirst();
    }
  }

  return current;
}

void main() {
  stdout.write(Enter a number );
  int n = int.parse(stdin.readLineSync()!);
  int result = dblLinear(n);
  print(dblLinear($n) = $result);
}