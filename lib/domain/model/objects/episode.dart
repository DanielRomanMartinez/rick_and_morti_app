import 'package:equatable/equatable.dart';
import 'package:rick_morti_api/domain/exceptions/malformed_map_exception.dart';

class Episode extends Equatable {
  final int id;
  final String name;
  final String episode;
  final String airDate;

  const Episode({
    required this.id,
    required this.name,
    required this.episode,
    required this.airDate,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    episode,
    airDate,
  ];

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'episode': episode,
    'airDate': airDate,
  };

  factory Episode.fromMap(Map<String, dynamic> map) {
    if (map['id'] is! int ||
        map['name'] is! String ||
        map['episode'] is! String ||
        map['airDate'] is! String) throw MalformedEpisodeMapException(map);

    return Episode(
      id: map['id'],
      name: map['name'],
      episode: map['episode'],
      airDate: map['airDate'],
    );
  }
}

class MalformedEpisodeMapException implements MalformedMapException {
  @override
  final Map<String, dynamic> map;

  MalformedEpisodeMapException(this.map);
}
