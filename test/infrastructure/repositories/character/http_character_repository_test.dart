import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morti_api/domain/model/objects/character.dart';
import 'package:rick_morti_api/domain/model/value_object/response.dart';
import 'package:rick_morti_api/domain/services/http_service.dart';
import 'package:rick_morti_api/infrastructure/repositories/character/http_character_repository.dart';

import 'http_character_repository_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  group('Tests over Character Repository', () {
    final Faker faker = Faker();
    final HttpService httpService = MockHttpService();
    final HttpCharacterRepository repository = HttpCharacterRepository(httpService);

    // TODO: Generate mock generator

    final int id = faker.randomGenerator.integer(5);
    final String name = faker.lorem.words(1).join('');
    final String status = faker.lorem.words(2).join('');
    final String origin = faker.lorem.words(2).join('');
    final String location = faker.lorem.words(2).join('');
    final String species = faker.lorem.words(2).join('');
    final String image = faker.lorem.words(2).join('');
    final String url = faker.lorem.words(2).join('');

    final String httpMockCharactersResponseOK = '''
    {
      "results": [{
        "id": $id,
        "name": "$name",
        "status": "$status",
        "species": "$species",
        "type": "",
        "gender": "Male",
        "origin": {
          "name": "$origin"
        },
        "location": {
          "name": "$location"
        },
        "image": "$image",
        "episode": [
          "$url"
        ]
      }]
    }''';

    final int idEpisode = faker.randomGenerator.integer(5);
    final String nameEpisode = faker.lorem.words(2).join('');
    final String airDate = faker.lorem.words(2).join('');
    final String episode = faker.lorem.words(2).join('');

    final String httpMockEpisodeResponseOK = '''
    {
      "id": $idEpisode,
      "name": "$nameEpisode",
      "air_date": "$airDate",
      "episode": "$episode"
    }
    ''';

    test('Connection OK - Super Hero OK - Reading All Characters', () async {
      when(httpService.get(Uri.parse(HttpCharacterRepository.urlApiAllCharacters))).thenAnswer(
          (_) => Future.value(Response(body: httpMockCharactersResponseOK, statusCode: 200, headers: const {'header': 'mock'})));

      when(httpService.get(Uri.parse(url))).thenAnswer(
              (_) => Future.value(Response(body: httpMockEpisodeResponseOK, statusCode: 200, headers: const {'header': 'mock'})));

      expect(await repository.readAll(), isA<List<Character>>());
    });

    // TODO: Make tests in case of connection fail (expect throw exception)

    // TODO: Make tests in case of malformed (expect throw exception)

    // TODO: Make tests calling other endpoints
  });
}
