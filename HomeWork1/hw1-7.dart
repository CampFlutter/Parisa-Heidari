void main() {
  const String name = 'Mohsen';
  const String surname = 'Javadian';
  const int age = 25;
  const double height = 175.5;
  const double weight = 70.2;
  
  double bmi = weight / ((height / 100) * (height / 100));

  print('Name: $name, Surname: $surname');
  print('Bmi: ${bmi.toStringAsFixed(2)}, Age: $age');
}