import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morti_api/application/bloc/main_screen/main_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morti_api/domain/model/objects/character.dart';
import 'package:rick_morti_api/ui/common/widgets/footer.dart';
import 'package:rick_morti_api/ui/common/widgets/star_icon.dart';
import 'package:rick_morti_api/ui/screens/character_details_screen/character_details_screen.dart';
import 'package:rick_morti_api/ui/theme/app_theme.dart';

part 'widgets/characters_list.dart';
part 'widgets/header.dart';
part 'widgets/navigation.dart';
part 'widgets/nav_drawer.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main-screen';

  final MainScreenBloc _mainScreenBloc = GetIt.instance.get<MainScreenBloc>();

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: NavDrawer(),
      body: Builder(builder: (context) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value:
              SystemUiOverlayStyle.light.copyWith(statusBarColor: (Platform.isAndroid) ? Colors.black : Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                Navigation(onPressedMenuIcon: () => Scaffold.of(context).openDrawer()),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 40),
                  child: InkWell(
                    onTap: () => _mainScreenBloc.add(const MainScreenEventLoadFavoritesCharacters()),
                    child: Row(
                      children: const [
                        Text(
                          "Mostrar favoritos:",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        StarIcon(isActive: true),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<MainScreenBloc, MainScreenState>(
                    bloc: _mainScreenBloc,
                    builder: (context, state) {
                      if (state is MainScreenCharactersLoaded) {
                        return CharactersList(characters: state.characters);
                      }

                      return Column(
                        children: [
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Cargando...',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(width: 20),
                              Center(child: CircularProgressIndicator(color: AppTheme.primaryButton)),
                              SizedBox(height: 50),
                            ],
                          ),
                        ],
                      );
                    }),
                const Footer(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
