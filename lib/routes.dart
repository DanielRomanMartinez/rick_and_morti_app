import 'package:flutter/material.dart';
import 'package:rick_morti_api/ui/screens/main_screen/main_screen.dart';
import 'package:rick_morti_api/ui/screens/character_details_screen/character_details_screen.dart';
import 'package:rick_morti_api/ui/screens/onboarding_screen/onboarding_screen.dart';

Map<String, WidgetBuilder> _routeGenerator() {
  final Map<String, WidgetBuilder> routes = {
    OnboardingScreen.routeName: (_) => const OnboardingScreen(),
    MainScreen.routeName: (_) => MainScreen(),
    CharacterDetailsScreen.routeName: (_) => const CharacterDetailsScreen(),
  };

  return routes;
}

final routes = _routeGenerator();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
