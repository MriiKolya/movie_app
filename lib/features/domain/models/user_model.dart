import 'package:equatable/equatable.dart';

class UserAuth extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? photo;

  const UserAuth({required this.id, this.name, this.email, this.photo});

  static const empty = UserAuth(id: '');

  bool get isEmpty => this == UserAuth.empty;
  bool get isNotEmpty => this != UserAuth.empty;

  @override
  List<Object?> get props => [id, name, email, photo];
}
