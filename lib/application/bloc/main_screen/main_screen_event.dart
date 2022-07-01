part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

// Events to Load information

class MainScreenEventLoad extends MainScreenEvent {
  const MainScreenEventLoad();

  @override
  List<Object?> get props => [];
}

class MainScreenEventLoadAllCharacters extends MainScreenEventLoad {
  const MainScreenEventLoadAllCharacters();
}

class MainScreenEventLoadUnknownGenderCharacters extends MainScreenEventLoad {
  const MainScreenEventLoadUnknownGenderCharacters();
}

class MainScreenEventLoadFemaleGenderCharacters extends MainScreenEventLoad {
  const MainScreenEventLoadFemaleGenderCharacters();
}

class MainScreenEventLoadMaleGenderCharacters extends MainScreenEventLoad {
  const MainScreenEventLoadMaleGenderCharacters();
}

class MainScreenEventLoadGenderlessCharacters extends MainScreenEventLoad {
  const MainScreenEventLoadGenderlessCharacters();
}

class MainScreenEventLoadCharactersBySearch extends MainScreenEventLoad {
  final String name;

  const MainScreenEventLoadCharactersBySearch({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}

class MainScreenEventLoadFavoritesCharacters extends MainScreenEventLoad {
  const MainScreenEventLoadFavoritesCharacters();
}

// Events to Save or Remove character as Favorite

class MainScreenEventFavorite extends MainScreenEvent {
  final Character character;

  const MainScreenEventFavorite({
    required this.character,
  });

  @override
  List<Object?> get props => [character];
}

class MainScreenEventSaveCharacterAsFavorite extends MainScreenEventFavorite {
  const MainScreenEventSaveCharacterAsFavorite({
    required Character character,
  }) : super(character: character);
}

class MainScreenEventRemoveCharacterAsFavorite extends MainScreenEventFavorite {
  const MainScreenEventRemoveCharacterAsFavorite({
    required Character character,
  }) : super(character: character);
}
