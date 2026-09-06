class GameModel{
  String? name;
  String? released;
  String? backgroundImage;
  double? rating;
  int? id;
  String? description;
  double? metacritic;
  int? ratingsCount;

  GameModel({
  this.backgroundImage,
  this.description,
  this.id,
  this.metacritic,
  this.name,
  this.rating,
  this.ratingsCount,
  this.released});

  factory GameModel.fromJson(Map<String, dynamic> json){
    return GameModel(
      name: json['name'],
      released: json['released'],
      backgroundImage: json['background_image'],
      rating: (json['rating'] as num?)?.toDouble(),
      id: json['id'],
      description: json['description'],
      metacritic: (json['metacritic'] as num?)?.toDouble(),
      ratingsCount: json['ratings_count']
    );
  }

}