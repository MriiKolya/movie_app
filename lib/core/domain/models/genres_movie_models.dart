class GenresMovieModel {
  final int id;
  final String name;

  GenresMovieModel({
    required this.id,
    required this.name,
  });

  factory GenresMovieModel.fromJson(Map<String, dynamic> json) {
    return GenresMovieModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
