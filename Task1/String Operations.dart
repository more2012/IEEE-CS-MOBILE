void main() {
  String str1 = "Hello";
  String str2 = " World";
  
  String concatenated = str1 + str2;
  int length = concatenated.length;
  String substring = concatenated.substring(0, 5);
  String upperCase = concatenated.toUpperCase();
  String lowerCase = concatenated.toLowerCase();

  print("Concatenated String: $concatenated");
  print("Length: $length");
  print("Substring: $substring");
  print("Uppercase: $upperCase");
  print("Lowercase: $lowerCase");
}
