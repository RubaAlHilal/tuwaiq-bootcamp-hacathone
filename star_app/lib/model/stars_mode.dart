class PlanetModel {
  int? planetID;
  String? planetname;
  String? discoverdAt;
  String? planetDiscoverer;
  String? planetDescription;
  double? distance;
  String? day;
  String? moons;
  double? gravity;
  String? imageUrl;

  PlanetModel(
      {this.planetID,
      this.planetname,
      this.discoverdAt,
      this.planetDiscoverer,
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
    planetDiscoverer = json['discoverer'];
    planetDescription = json["description"];
    distance = json['distance'];
    day = json['day'];
    moons = json['moons '];
    gravity = json['gravity'];
    imageUrl = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = planetID;
    data['name'] = planetname;
    data['discovered'] = discoverdAt;
    data['discoverer'] = planetDiscoverer;
    data['description'] = planetDescription;
    data['distance'] = distance;
    data['day'] = day;
    data['moons'] = moons;
    data['gravity '] = gravity;
    data['image '] = imageUrl;

    return data;
  }
}
