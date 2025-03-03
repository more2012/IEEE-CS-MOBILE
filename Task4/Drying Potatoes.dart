int potatoes(int p0,int w0,int p1) {
  double dryMatter= w0*(100-p0) /100; 
  int w1= (dryMatter*100 /(100-p1)).truncate(); 
  return w1;
}
void main() {
  print(potatoes(99,100,98)); // 50
  print(potatoes(90,200,80)); // 100
  print(potatoes(95,100,90)); // 50
}
