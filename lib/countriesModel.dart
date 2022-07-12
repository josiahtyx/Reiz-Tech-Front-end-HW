// To parse this JSON data, do
//
//     final countries = countriesFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Countries> countriesFromMap(String str) =>
    List<Countries>.from(json.decode(str).map((x) => Countries.fromMap(x)));

String countriesToMap(List<Countries> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Countries {
  Countries({
    required this.name,
    required this.region,
    required this.area,
    required this.independent,
  });

  final String? name;
  final String? region;
  final double? area;
  final bool? independent;

  factory Countries.fromMap(Map<String, dynamic> json) => Countries(
        name: json["name"],
        region: json["region"],
        area: json["area"] == null ? null : json["area"].toDouble(),
        independent: json["independent"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "region": region,
        "area": area == null ? null : area,
        "independent": independent,
      };
}

// enum Region {
//   ASIA,
//   EUROPE,
//   AFRICA,
//   OCEANIA,
//   AMERICAS,
//   POLAR,
//   ANTARCTIC_OCEAN,
//   ANTARCTIC
// }

// final regionValues = EnumValues({
//   "Africa": Region.AFRICA,
//   "Americas": Region.AMERICAS,
//   "Antarctic": Region.ANTARCTIC,
//   "Antarctic Ocean": Region.ANTARCTIC_OCEAN,
//   "Asia": Region.ASIA,
//   "Europe": Region.EUROPE,
//   "Oceania": Region.OCEANIA,
//   "Polar": Region.POLAR
// });

// class EnumValues<T> {
//   late Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
