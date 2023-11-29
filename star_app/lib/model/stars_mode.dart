class PlanetModel {
  int? planetID;
  String? planetname;
  String? discoverdAt;
  String? planetDescription;
  num? distance;
  String? day;
  String? moons;
  num? gravity;
  String? imageUrl;

  PlanetModel(
      {this.planetID,
      this.planetname,
      this.discoverdAt,
      this.planetDescription,
      this.distance,
      this.day,
      this.gravity,
      this.moons,
      this.imageUrl});

  PlanetModel.fromJson(Map<String, dynamic> json) {
    planetID = json['id'];
    planetname = json['name'];
    discoverdAt = json['discovered'];
    planetDescription = json["description"];
    distance = json['distance'];
    day = json['day'];
    moons = json['moons'];
    gravity = json['gravity'];
    imageUrl = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = planetID ?? 1;
    data['name'] = planetname ?? "";
    data['discovered'] = discoverdAt ?? "";
    data['description'] = planetDescription ?? "";
    data['distance'] = distance ?? 0.0;
    data['day'] = day ?? "";
    data['moons'] = moons ?? "";
    data['gravity'] = gravity ?? 0.0;
    data['image'] = imageUrl ?? "";

    return data;
  }
}
