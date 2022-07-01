import 'package:equatable/equatable.dart';
import 'package:rick_morti_api/domain/exceptions/malformed_map_exception.dart';

import 'episode.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String origin;
  final String location;
  final String species;
  final String image;
  final bool? isFavorite;
  final List<Episode> episodes;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.origin,
    required this.location,
    required this.species,
    required this.image,
    required this.isFavorite,
    required this.episodes,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        origin,
        location,
        species,
        image,
        isFavorite,
        episodes,
      ];

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'status': status,
        'origin': origin,
        'location': location,
        'species': species,
        'image': image,
        'isFavorite': isFavorite,
        'episodes': episodes,
      };

  factory Character.fromMap(Map<String, dynamic> map) {
    if (map['id'] is! int ||
        map['name'] is! String ||
        map['status'] is! String ||
        map['origin'] is! String ||
        map['location'] is! String ||
        map['species'] is! String ||
        map['image'] is! String ||
        !(map['isFavorite'] == null || map['isFavorite'] != null && map['isFavorite'] is bool?) ||
        map['episodes'] is! List<Episode>) throw MalformedCharacterMapException(map);

    return Character(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      origin: map['origin'],
      location: map['location'],
      species: map['species'],
      image: map['image'],
      isFavorite: map['isFavorite'],
      episodes: map['episodes'],
    );
  }
}

class MalformedCharacterMapException implements MalformedMapException {
  @override
  final Map<String, dynamic> map;

  MalformedCharacterMapException(this.map);
}
