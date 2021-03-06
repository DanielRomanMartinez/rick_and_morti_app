// Mocks generated by Mockito 5.2.0 from annotations
// in rick_morti_api/test/application/main_screen/main_screen_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rick_morti_api/domain/model/objects/character.dart' as _i4;
import 'package:rick_morti_api/domain/services/character_service.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [CharacterService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCharacterService extends _i1.Mock implements _i2.CharacterService {
  MockCharacterService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Character>> readAll() =>
      (super.noSuchMethod(Invocation.method(#readAll, []),
              returnValue: Future<List<_i4.Character>>.value(<_i4.Character>[]))
          as _i3.Future<List<_i4.Character>>);
  @override
  _i3.Future<List<_i4.Character>> readFemaleCharacters() =>
      (super.noSuchMethod(Invocation.method(#readFemaleCharacters, []),
              returnValue: Future<List<_i4.Character>>.value(<_i4.Character>[]))
          as _i3.Future<List<_i4.Character>>);
  @override
  _i3.Future<List<_i4.Character>> readGenderlessCharacters() =>
      (super.noSuchMethod(Invocation.method(#readGenderlessCharacters, []),
              returnValue: Future<List<_i4.Character>>.value(<_i4.Character>[]))
          as _i3.Future<List<_i4.Character>>);
  @override
  _i3.Future<List<_i4.Character>> searchCharacters({String? name}) => (super
          .noSuchMethod(Invocation.method(#searchCharacters, [], {#name: name}),
              returnValue: Future<List<_i4.Character>>.value(<_i4.Character>[]))
      as _i3.Future<List<_i4.Character>>);
  @override
  _i3.Future<List<_i4.Character>> readMaleCharacters() =>
      (super.noSuchMethod(Invocation.method(#readMaleCharacters, []),
              returnValue: Future<List<_i4.Character>>.value(<_i4.Character>[]))
          as _i3.Future<List<_i4.Character>>);
  @override
  _i3.Future<List<_i4.Character>> readUnknownCharacters() =>
      (super.noSuchMethod(Invocation.method(#readUnknownCharacters, []),
              returnValue: Future<List<_i4.Character>>.value(<_i4.Character>[]))
          as _i3.Future<List<_i4.Character>>);
}
