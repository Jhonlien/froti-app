part of 'Models.dart';

class PlantDetail extends Plant {
  final String? content;

  PlantDetail(Plant plant, {this.content})
      : super(id: plant.id, gambar: plant.gambar, judul: plant.judul);

  @override
  List<Object> get props => super.props + [content!];
}
