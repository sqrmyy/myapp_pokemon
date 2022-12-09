import 'package:flutter/material.dart';

class PokeDetail extends StatelessWidget {
  const PokeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  child: Image.network(
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
                    height: 100,
                    width: 100,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'No.25',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'pikachu',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Chip(
              label: Text('electric'),
              backgroundColor: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"),
          ),
        ),
      ),
      title: const Text(
        'Pikachu',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(
        '⚡️electric',
      ),
      trailing: const Icon(Icons.navigate_next),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const PokeDetail(),
          ),
        ),
      },
    );
  }
}
