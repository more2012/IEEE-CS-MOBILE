bool isTidyNumber(int n) {
  String numString= n.toString(); 
  for (int i=0; i < numString.length-1; i++) {
    if (numString[i].compareTo(numString[i + 1]) > 0) {
      return false; 
    }
  }
  return true; 
}

void main() {
  print(isTidyNumber(12));   
  print(isTidyNumber(32));    
  print(isTidyNumber(1024));  
  print(isTidyNumber(13579)); 
  print(isTidyNumber(2335));  
}
