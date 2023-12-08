import 'package:movie_app/core/value_objects/value_objects_model.dart';

class EmailVO extends ValueObject<String> {
  EmailVO(super.value);

  @override
  String? validate() {
    if (value.isEmpty) {
      return 'Enter email';
    } else {
      if (value.isNotEmpty &&
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
        return null;
      } else {
        return 'Enter valid Email';
      }
    }
  }
}
