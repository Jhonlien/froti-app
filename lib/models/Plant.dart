part of 'Models.dart';

class Plant extends Equatable {
  final String? id;
  final String? judul;
  final String? gambar;

  Plant({
    @required this.id,
    @required this.judul,
    @required this.gambar,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        id: (json['id'] as String),
        judul: json['judul'],
        gambar: (json['gambar'] as String),
      );
  @override
  List<Object> get props => [
        id!,
        judul!,
        gambar!,
      ];
}
