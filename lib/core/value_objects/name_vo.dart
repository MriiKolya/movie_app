import 'package:movie_app/core/value_objects/value_objects_model.dart';

class NameVO extends ValueObject<String> {
  NameVO(super.value);

  @override
  String? validate() {
    if (value.isEmpty) {
      return 'Enter name';
    } else if (value.length < 3) {
      return 'Must be more than 2 charater';
    } else {
      return null;
    }
  }
}
