import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morti_api/domain/model/objects/character.dart';
import 'package:rick_morti_api/domain/services/character_service.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

@lazySingleton
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final CharacterService _characterService;

  MainScreenBloc(
    this._characterService,
  ) : super(const MainScreenInitial()) {
    on<MainScreenEventLoadAllCharacters>(_handleLoadAllCharacters);
    on<MainScreenEventLoadUnknownGenderCharacters>(_handleLoadUnknownGenderCharacters);
    on<MainScreenEventLoadFemaleGenderCharacters>(_handleLoadFemaleGenderCharacters);
    on<MainScreenEventLoadMaleGenderCharacters>(_handleLoadMaleGenderCharacters);
    on<MainScreenEventLoadGenderlessCharacters>(_handleLoadGenderlessCharacters);
    on<MainScreenEventLoadCharactersBySearch>(_handleLoadCharactersBySearch);
    on<MainScreenEventLoadFavoritesCharacters>(_handleLoadFavoritesCharacters);
    on<MainScreenEventSaveCharacterAsFavorite>(_handleSaveCharacterAsFavorite);
    on<MainScreenEventRemoveCharacterAsFavorite>(_handleRemoveCharacterAsFavorite);

    add(const MainScreenEventLoadAllCharacters());
  }

  void _handleLoadAllCharacters(
    MainScreenEventLoadAllCharacters event,
    Emitter<MainScreenState> emit,
  ) async {
    try {
      emit(MainScreenCharactersLoaded(characters: await _characterService.readAll()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadUnknownGenderCharacters(
      MainScreenEventLoadUnknownGenderCharacters event,
    Emitter<MainScreenState> emit,
  ) async {
    emit(const MainScreenLoadingCharacters());
    try {
      emit(MainScreenCharactersLoaded(characters: await _characterService.readUnknownCharacters()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadFemaleGenderCharacters(
      MainScreenEventLoadFemaleGenderCharacters event,
      Emitter<MainScreenState> emit,
      ) async {
    emit(const MainScreenLoadingCharacters());
    try {
      emit(MainScreenCharactersLoaded(characters: await _characterService.readFemaleCharacters()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadMaleGenderCharacters(
      MainScreenEventLoadMaleGenderCharacters event,
      Emitter<MainScreenState> emit,
      ) async {
    emit(const MainScreenLoadingCharacters());
    try {
      emit(MainScreenCharactersLoaded(characters: await _characterService.readMaleCharacters()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadGenderlessCharacters(
      MainScreenEventLoadGenderlessCharacters event,
      Emitter<MainScreenState> emit,
      ) async {
    emit(const MainScreenLoadingCharacters());
    try {
      emit(MainScreenCharactersLoaded(characters: await _characterService.readGenderlessCharacters()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadCharactersBySearch(
      MainScreenEventLoadCharactersBySearch event,
      Emitter<MainScreenState> emit,
      ) async {
    emit(const MainScreenLoadingCharacters());
    try {
      emit(MainScreenCharactersLoaded(characters: await _characterService.searchCharacters(name: event.name)));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleLoadFavoritesCharacters(
      MainScreenEventLoadFavoritesCharacters event,
      Emitter<MainScreenState> emit,
      ) async {
    emit(const MainScreenLoadingCharacters());
    try {
      emit(MainScreenCharactersLoaded(characters: await _characterService.readAll()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleSaveCharacterAsFavorite(
      MainScreenEventSaveCharacterAsFavorite event,
      Emitter<MainScreenState> emit,
      ) async {
    emit(const MainScreenLoadingCharacters());
    try {
      emit(MainScreenCharactersLoaded(characters: await _characterService.readAll()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _handleRemoveCharacterAsFavorite(
      MainScreenEventRemoveCharacterAsFavorite event,
      Emitter<MainScreenState> emit,
      ) async {
    emit(const MainScreenLoadingCharacters());
    try {
      emit(MainScreenCharactersLoaded(characters: await _characterService.readAll()));
    } on Exception catch (_, e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
