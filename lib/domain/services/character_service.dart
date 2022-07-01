import 'package:injectable/injectable.dart';
import 'package:rick_morti_api/domain/model/objects/character.dart';
import 'package:rick_morti_api/domain/repositories/character_api_repository.dart';

@injectable
class CharacterService {
  final CharacterApiRepository _characterApiRepository;

  const CharacterService(
    this._characterApiRepository,
  );

  Future<List<Character>> readAll() async {
    try {
      return await _characterApiRepository.readAll();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Character>> readFemaleCharacters() async {
    try {
      return await _characterApiRepository.readFemaleCharacters();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Character>> readGenderlessCharacters() async {
    try {
      return await _characterApiRepository.readGenderlessCharacters();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Character>> searchCharacters({
    required String name,
  }) async {
    try {
      return await _characterApiRepository.readCharactersByName(name);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Character>> readMaleCharacters() async {
    try {
      return await _characterApiRepository.readMaleCharacters();
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Character>> readUnknownCharacters() async {
    try {
      return await _characterApiRepository.readUnknownCharacters();
    } catch (_) {
      rethrow;
    }
  }
}
