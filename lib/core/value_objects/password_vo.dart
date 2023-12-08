import 'package:movie_app/core/value_objects/value_objects_model.dart';

class PasswordVO extends ValueObject<String> {
  const PasswordVO(super.value);

  @override
  String? validate() {
    if (value.isEmpty) {
      return 'Enter password';
    } else {
      return null;
    }
  }
}
