import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morti_api/domain/model/objects/character.dart';
import 'package:simple_html_css/simple_html_css.dart';

class CharacterDetailParams {
  final Character character;

  CharacterDetailParams({
    required this.character,
  });
}

class CharacterDetailsScreen extends StatelessWidget {
  static const routeName = '/character-screen-detail-screen';

  const CharacterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CharacterDetailParams;
    final Character character = args.character;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value:
            SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    character.name,
                    style: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.network(character.image),
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: HTML.toTextSpan(
                    context,
                    '<b>Origin: </b>${character.origin}',
                    defaultTextStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                    overrideStyle: {
                      'b': const TextStyle(fontWeight: FontWeight.bold)
                    },
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: HTML.toTextSpan(
                    context,
                    '<b>Status: </b>${character.status}',
                    defaultTextStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                    overrideStyle: {
                      'b': const TextStyle(fontWeight: FontWeight.bold)
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
