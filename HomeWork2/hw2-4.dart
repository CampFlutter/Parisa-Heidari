void main() {
  const text = "Dart was unveiled at the GOTO conference in Aarhus, Denmark, October Lars Bak and Kasper Lund founded the project Dart was released in November, Dart had a mixed reception at first. Some criticized the Dart initiative for fragmenting the web because of plans to include a Dart VM in Chrome. Those plans were dropped in with the Dart release. Focus changed to compiling Dart code to JavaScript.";

  final wordLengthCount = <int, int>{};

  text.split(' ').forEach((word) {
    final length = word.length;
    wordLengthCount[length] = (wordLengthCount[length] ?? 0) + 1;
  });

  wordLengthCount.forEach((length, count) {
    print('$length letter(s): $count');
  });
}
