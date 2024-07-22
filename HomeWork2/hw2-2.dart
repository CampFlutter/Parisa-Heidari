void main() {
    var numbers = [1, 3.2, 4, 2.1, 6.5, 9, 10.1, 5.9, 8, 7.6];

    for (num number in numbers) {
      if (number is int) {
        print('$number is int, power 2 is ${powerOfTwo(number)}');
      }
      else if (number is double) {
        print('$number is double, power 3 is ${powerOfThree(number).toStringAsFixed(1)}');
      }
    }
}

int powerOfTwo(int n) {
  return n * n;
}

double powerOfThree(double n) {
  return n * n * n;
}
