void main() {
  var str_numbers = ["1.1", "3.2", "4.4", "2.0", "6.5", "9.2", "10.1", "5.9", "8.7", "7.8"];
  var number= [];

    for (String strnum in str_numbers) {
    double decimalNumber = double.parse(strnum);
    number.add(decimalNumber);
  }

  var round_str_number = [];

  for (double decimalNumber in number) {
    int roundedNumber = decimalNumber.round();
    round_str_number.add(roundedNumber.toString());
  }

  for (String round_string in round_str_number) {
    print(round_string);
  }
}
