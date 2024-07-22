Map<int, int> fibonacciCache = {};

int fibonacci(int n) {
  if (n <= 1) {
    return n;
  }

  if (fibonacciCache.containsKey(n)) {
    return fibonacciCache[n]!;
  }

  int result = fibonacci(n - 1) + fibonacci(n - 2);
  fibonacciCache[n] = result;
  return result;
}

void main() {
  int n = 122;
  print('The $n-th number in the Fibonacci sequence is: ${fibonacci(n)}');
}