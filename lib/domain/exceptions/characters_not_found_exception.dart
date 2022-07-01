import 'package:rick_morti_api/domain/exceptions/repository_error_exception.dart';

class CharactersNotFoundException implements RepositoryErrorException {
  const CharactersNotFoundException();
}
