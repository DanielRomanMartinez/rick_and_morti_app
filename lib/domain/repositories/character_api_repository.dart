import 'package:rick_morti_api/domain/model/objects/character.dart';

abstract class CharacterApiRepository {
  Future<List<Character>> readAll();
  Future<List<Character>> readFemaleCharacters();
  Future<List<Character>> readMaleCharacters();
  Future<List<Character>> readGenderlessCharacters();
  Future<List<Character>> readCharactersByName(String name);
  Future<List<Character>> readUnknownCharacters();
  Future<List<int>> readFavoriteCharactersIds();
  Future<List<Character>> saveFavoriteCharacter({
    required Character character,
  });
  Future<List<Character>> removeFavoriteCharacters({
    required Character character,
  });
}

