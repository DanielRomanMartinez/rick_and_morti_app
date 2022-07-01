import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:rick_morti_api/domain/exceptions/characters_not_found_exception.dart';
import 'package:rick_morti_api/domain/model/objects/character.dart';
import 'package:rick_morti_api/domain/model/objects/episode.dart';
import 'package:rick_morti_api/domain/model/value_object/response.dart';
import 'package:rick_morti_api/domain/repositories/character_api_repository.dart';
import 'package:rick_morti_api/domain/services/http_service.dart';

@Injectable(as: CharacterApiRepository)
class HttpCharacterRepository implements CharacterApiRepository {
  final HttpService _httpService;

  HttpCharacterRepository(
    this._httpService,
  );

  static const String urlApiAllCharacters = 'https://rickandmortyapi.com/api/character';
  static const String urlApiAllCharactersByGender = 'https://rickandmortyapi.com/api/character/?gender=';
  static const String urlApiAllCharactersByName = 'https://rickandmortyapi.com/api/character/?name=';

  // TODO: Make read for various page not only first page
  @override
  Future<List<Character>> readAll() async => await _readCharactersFromApiUrl(urlApiAllCharacters);

  @override
  Future<List<Character>> readFemaleCharacters() async => await _readCharactersFromApiUrl('${urlApiAllCharactersByGender}female');

  @override
  Future<List<Character>> readGenderlessCharacters() async => await _readCharactersFromApiUrl('${urlApiAllCharactersByGender}genderless');

  @override
  Future<List<Character>> readCharactersByName(String name) async => await _readCharactersFromApiUrl('$urlApiAllCharactersByName$name');

  @override
  Future<List<Character>> readMaleCharacters() async => await _readCharactersFromApiUrl('${urlApiAllCharactersByGender}male');

  @override
  Future<List<Character>> readUnknownCharacters() async => await _readCharactersFromApiUrl('${urlApiAllCharactersByGender}unknown');

  Future<List<Character>> _readCharactersFromApiUrl(String url) async {
    final List<Character> characters = [];
    List<Episode> episodes = [];

    final Response response = await _httpService.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> charactersApiResponse = jsonDecode(response.body)['results'];

      for (var character in charactersApiResponse) {
        episodes = [];
        for (var episode in character['episode']) {
          final Response episodesResponse = await _httpService.get(Uri.parse(episode));
          Map<String, dynamic> episodesApiResponse = jsonDecode(episodesResponse.body);

          if (episodesResponse.statusCode == 200) {
            Map<String, dynamic> episodeMap = {
              'id': episodesApiResponse['id'],
              'name': episodesApiResponse['name'],
              'episode': episodesApiResponse['episode'],
              'airDate': episodesApiResponse['air_date'],
            };
            episodes.add(Episode.fromMap(episodeMap));
          } else {
            throw const CharactersNotFoundException();
          }
        }

        Map<String, dynamic> characterMap = {
          'id': character['id'],
          'name': character['name'],
          'status': character['status'],
          'origin': character['origin']['name'],
          'location': character['location']['name'],
          'species': character['species'],
          'image': character['image'],
          'isFavorite': false, // TODO: Calculate
          'episodes': episodes,
        };
        characters.add(Character.fromMap(characterMap));
      }

      return characters;
    } else {
      throw const CharactersNotFoundException();
    }
  }

  @override
  Future<List<int>> readFavoriteCharactersIds() {
    // TODO: implement readFavoriteCharactersIds
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> removeFavoriteCharacters({required Character character}) {
    // TODO: implement removeFavoriteCharacters
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> saveFavoriteCharacter({required Character character}) {
    // TODO: implement saveFavoriteCharacter
    throw UnimplementedError();
  }
}
