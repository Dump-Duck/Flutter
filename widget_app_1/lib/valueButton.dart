class MyValue {
  int value;
  MyValue({
    required this.value,
  });

  void increase() {
    value++;
  }

  void decrease() {
    value--;
  }

  void reset() {
    this.value = 0;
  }

  void removeValue(int x) {
    this.value -= x;
  }

  void addValue(int x) {
    this.value += x;
  }
}