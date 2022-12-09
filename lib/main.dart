import 'package:flutter/material.dart';
import 'package:myapp_pokemon/poke_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode mode = ThemeMode.system;
    return MaterialApp(
      title: 'Pokemon Flutter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: mode,
      home: const TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentbnb = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: currentbnb == 0 ? const PokeList() : const Settings(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(
            () {
              currentbnb = index;
            },
          ),
        },
        currentIndex: currentbnb,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}

class PokeList extends StatelessWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      itemCount: 898,
      itemBuilder: (context, index) => PokeListItem(index: index),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.lightbulb),
          title: Text('Dark/Light Mode'),
          trailing: Text(
            (_themeMode == ThemeMode.system)
                ? 'System'
                : (_themeMode == ThemeMode.dark ? 'Dark' : 'Light'),
          ),
          onTap: () async {
            var ret = await Navigator.of(context).push<ThemeMode>(
              MaterialPageRoute(
                builder: (context) => ThemeModeSelectionPage(mode: _themeMode),
              ),
            );
            setState(
              () {
                _themeMode = ret!;
              },
            );
          },
        ),
        SwitchListTile(
          title: const Text('Switch'),
          value: true,
          onChanged: (yes) => {},
        ),
        CheckboxListTile(
          title: const Text('Checkbox'),
          value: true,
          onChanged: (yes) => {},
        ),
        RadioListTile(
          title: const Text('Radio'),
          value: true,
          groupValue: true,
          onChanged: (yes) => {},
        ),
      ],
    );
  }
}

class ThemeModeSelectionPage extends StatefulWidget {
  const ThemeModeSelectionPage({
    Key? key,
    required this.mode,
  }) : super(key: key);
  final ThemeMode mode;

  @override
  State<ThemeModeSelectionPage> createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState extends State<ThemeModeSelectionPage> {
  late ThemeMode _current;

  @override
  void initState() {
    super.initState();
    _current = widget.mode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop<ThemeMode>(context, _current),
              ),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: _current,
              title: const Text('System'),
              onChanged: (val) => {
                setState(
                  () {
                    _current = val!;
                  },
                ),
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: _current,
              title: const Text('Dark'),
              onChanged: (val) => {
                setState(
                  () {
                    _current = val!;
                  },
                ),
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: _current,
              title: const Text('Light'),
              onChanged: (val) => {
                setState(
                  () {
                    _current = val!;
                  },
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PikaButton extends StatelessWidget {
  const PikaButton({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('pikachu'),
      onPressed: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const PokeDetail(),
          ),
        ),
      },
    );
  }
}
