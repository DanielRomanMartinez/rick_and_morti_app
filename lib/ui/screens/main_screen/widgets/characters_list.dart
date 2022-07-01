part of '../main_screen.dart';

class CharactersList extends StatelessWidget {
  final List<Character> characters;
  final MainScreenBloc _mainScreenBloc = GetIt.instance.get<MainScreenBloc>();

  CharactersList({
    Key? key,
    required this.characters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bottom = 30;
    double top = 30;

    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        if (index == 0) top = 0;

        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              CharacterDetailsScreen.routeName,
              arguments: CharacterDetailParams(
                character: characters[index],
              ),
            );
          },
          child: Container(
            alignment: Alignment.topLeft,
            height: 150,
            margin: EdgeInsets.only(top: top, right: 16, left: 16, bottom: bottom),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffB9B9B9), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Image.network(characters[index].image),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 14,
                      child: InkWell(
                        onTap: () =>
                            _mainScreenBloc.add(MainScreenEventSaveCharacterAsFavorite(character: characters[index])),
                        child: StarIcon(isActive: characters[index].isFavorite ?? false),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Color(0xFFB2DF28),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${characters[index].status} - ${characters[index].species}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3.5),
                      Text(
                        characters[index].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Last know location:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 3.5),
                      Text(
                        characters[index].location,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "First seen in:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 3.5),
                      Text(
                        characters[index].episodes.first.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
