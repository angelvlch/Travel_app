class TourModel {
  final int? id;
  final String? name;
  final String? photo;
  final String? description;
  final String? location;
  final int? category;

  TourModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.location,
    required this.category,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) => TourModel(
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
        description: json['description'],
        location: json['location'],
        category: json['category'],
      );
}
