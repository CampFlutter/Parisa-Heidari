void main() {
  const String text = 'Dart is an approachable, portable, and productive language for high-quality apps on any platform.';
  
  var words = text.split(' ');
  
  for (int i = 0; i < words.length; i++) {
    if (words[i].length == 3) {
      words[i] = words[i].toUpperCase();
    }
  }

  String new_text = words.join(' ');
  print(new_text);
}