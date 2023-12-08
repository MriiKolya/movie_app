abstract class ValueObject<T> {
  const ValueObject(this.value);
  final T value;
  String? validate();
}
