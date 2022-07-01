part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState extends Equatable {
  const MainScreenState();
}

class MainScreenInitial extends MainScreenState {
  const MainScreenInitial();

  @override
  List<Object> get props => [];
}

class MainScreenLoadingCharacters extends MainScreenInitial {
  const MainScreenLoadingCharacters();
}

class MainScreenCharactersLoaded extends MainScreenState {
  final List<Character> characters;

  const MainScreenCharactersLoaded({
    required this.characters,
  });

  @override
  List<Object> get props => [characters];
}