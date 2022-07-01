import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morti_api/application/bloc/main_screen/main_screen_bloc.dart';
import 'package:rick_morti_api/domain/model/objects/character.dart';
import 'package:rick_morti_api/domain/model/objects/episode.dart';
import 'package:rick_morti_api/domain/services/character_service.dart';

import 'main_screen_bloc_test.mocks.dart';

@GenerateMocks([
  CharacterService,
])
void main() {
  final Faker faker = Faker();

  final CharacterService characterService = MockCharacterService();

  group('Main Screen Bloc', () {
    // TODO: Generate MockGenerator Character

    final int id = faker.randomGenerator.integer(5);
    final String name = faker.lorem.words(1).join('');
    final String image = faker.lorem.words(2).join('');
    final String status = faker.lorem.words(2).join('');
    final String location = faker.lorem.words(2).join('');
    final String species = faker.lorem.words(2).join('');
    final String origin = faker.lorem.words(2).join('');
    final List<Episode> episodes = [];

    final List<Character> characters = [
      Character(
        id: id,
        name: name,
        image: image,
        episodes: episodes,
        isFavorite: null,
        status: status,
        location: location,
        species: species,
        origin: origin,
      ),
    ];

    when(characterService.readAll()).thenAnswer((_) => Future.value(characters));
    when(characterService.readFemaleCharacters()).thenAnswer((_) => Future.value(characters));

    blocTest(
      'Creating Bloc',
      build: () => MainScreenBloc(
        characterService,
      ),
      expect: () => [
        MainScreenCharactersLoaded(characters: characters),
      ],
      verify: (_) {
        verify(characterService.readAll()).called(1);
      },
    );

    blocTest(
      'Send Female Characters',
      build: () => MainScreenBloc(
        characterService,
      )..add(const MainScreenEventLoadFemaleGenderCharacters()),
      expect: () => [
        MainScreenCharactersLoaded(characters: characters),
        const MainScreenLoadingCharacters(),
        MainScreenCharactersLoaded(characters: characters),
      ],
      verify: (_) {
        verify(characterService.readAll()).called(1);
        verify(characterService.readFemaleCharacters()).called(1);
      },
    );
  });
}
