class TourEntity {
  final int? id;
  final String? name;
  final String? photo;
  final String? description;
  final String? location;
  final int? category;

  TourEntity({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.location,
    required this.category,
  });
}
