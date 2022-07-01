import 'package:flutter/material.dart';
import 'package:rick_morti_api/routes.dart';
import 'package:rick_morti_api/ui/screens/onboarding_screen/onboarding_screen.dart';

class CharacterYuki extends StatelessWidget {
  const CharacterYuki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: OnboardingScreen.routeName,
      routes: routes,
    );
  }
}
