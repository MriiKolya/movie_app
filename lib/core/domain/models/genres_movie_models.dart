import 'package:equatable/equatable.dart';

class GenresMovieModel extends Equatable {
  final int id;
  final String name;

  const GenresMovieModel({
    required this.id,
    required this.name,
  });

  factory GenresMovieModel.fromJson(Map<String, dynamic> json) {
    return GenresMovieModel(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}
