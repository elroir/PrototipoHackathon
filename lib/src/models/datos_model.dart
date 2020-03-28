import 'dart:convert';

DatosModel datosModelFromJson(String str) => DatosModel.fromJson(json.decode(str));

String datosModelToJson(DatosModel data) => json.encode(data.toJson());

class DatosModel {
  Location location;

  DatosModel({
    this.location,
  });

  factory DatosModel.fromJson(Map<String, dynamic> json) => DatosModel(
    location: Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
  };
}

class Location {
  int id;
  String country;
  String countryCode;
  int countryPopulation;
  String province;
  String county;
  DateTime lastUpdated;
  Coordinates coordinates;
  Latest latest;

  Location({
    this.id,
    this.country,
    this.countryCode,
    this.countryPopulation,
    this.province,
    this.county,
    this.lastUpdated,
    this.coordinates,
    this.latest,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    country: json["country"],
    countryCode: json["country_code"],
    countryPopulation: json["country_population"],
    province: json["province"],
    county: json["county"],
    lastUpdated: DateTime.parse(json["last_updated"]),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    latest: Latest.fromJson(json["latest"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country": country,
    "country_code": countryCode,
    "country_population": countryPopulation,
    "province": province,
    "county": county,
    "last_updated": lastUpdated.toIso8601String(),
    "coordinates": coordinates.toJson(),
    "latest": latest.toJson(),
  };
}

class Coordinates {
  String latitude;
  String longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Latest {
  int confirmed;
  int deaths;
  int recovered;

  Latest({
    this.confirmed,
    this.deaths,
    this.recovered,
  });

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
    confirmed: json["confirmed"],
    deaths: json["deaths"],
    recovered: json["recovered"],
  );

  Map<String, dynamic> toJson() => {
    "confirmed": confirmed,
    "deaths": deaths,
    "recovered": recovered,
  };
}
