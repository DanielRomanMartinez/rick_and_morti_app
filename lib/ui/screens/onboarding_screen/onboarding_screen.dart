import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morti_api/ui/common/widgets/squadmakers_logo.dart';
import 'package:rick_morti_api/ui/screens/main_screen/main_screen.dart';
import 'package:rick_morti_api/ui/theme/app_theme.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(statusBarColor: (Platform.isAndroid) ? Colors.black : Colors.white),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/onboarding_screen/background.png"),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black.withOpacity(0.80),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SquadMakersLogo(),
                  const SizedBox(height: 7),
                  Image.asset(
                    'assets/onboarding_screen/rick_and_morty_logo.png',
                    width: 271,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Bienvenido \n a Rick and Morty',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      'En esta prueba, evaluaremos su capacidad para construit la aplicaci??n mediante el an??lisis de c??digo y la reproducci??n del siquiente dise??o.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 152),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      primary: AppTheme.primaryButton,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      onPrimary: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
