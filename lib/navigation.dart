import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationDrawer].

void main() => runApp(const NavigationDrawerApp());

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('Messages', Icon(Icons.widgets_outlined), Icon(Icons.widgets)),
  ExampleDestination('Profile', Icon(Icons.format_paint_outlined), Icon(Icons.format_paint)),
  ExampleDestination('Settings', Icon(Icons.settings_outlined), Icon(Icons.settings)),
];

class NavigationDrawerApp extends StatelessWidget {
  const NavigationDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const NavigationDrawerExample(),
    );
  }
}

class NavigationDrawerExample extends StatefulWidget {
  const NavigationDrawerExample({super.key});

  @override
  State<NavigationDrawerExample> createState() => _NavigationDrawerExampleState();
}

class _NavigationDrawerExampleState extends State<NavigationDrawerExample> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  Widget buildBottomBarScaffold() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[Text('Page Index = $screenIndex')],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
          });
        },
        destinations:
            destinations.map((ExampleDestination destination) {
              return NavigationDestination(
                label: destination.label,
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                tooltip: destination.label,
              );
            }).toList(),
      ),
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                minWidth: 50,
                destinations:
                    destinations.map((ExampleDestination destination) {
                      return NavigationRailDestination(
                        label: Text(destination.label),
                        icon: destination.icon,
                        selectedIcon: destination.selectedIcon,
                      );
                    }).toList(),
                selectedIndex: screenIndex,
                useIndicator: true,
                onDestinationSelected: (int index) {
                  setState(() {
                    screenIndex = index;
                  });
                },
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Page Index = $screenIndex'),
                  ElevatedButton(onPressed: openDrawer, child: const Text('Open Drawer')),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text('Header', style: Theme.of(context).textTheme.titleSmall),
          ),
          ...destinations.map((ExampleDestination destination) {
            return NavigationDrawerDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            );
          }),
          const Padding(padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 450;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer ? buildDrawerScaffold(context) : buildBottomBarScaffold();
  }
}







class Drawer1 extends StatefulWidget {
  const Drawer1({super.key, required this.title});

  final String title;

  @override
  State<Drawer1> createState() => _Drawer1HomeState();
}

class _Drawer1HomeState extends State<Drawer1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Hafidz"),
              accountEmail: Text("Hafidz@muslim.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/joker.jpg',
                ), // Ganti dengan gambar lokal Anda
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            _createDrawerItem(icon: Icons.home, text: 'Home'),
            _createDrawerItem(icon: Icons.favorite, text: 'Favourites'),
            _createDrawerItem(icon: Icons.work, text: 'Workflow'),
            _createDrawerItem(icon: Icons.update, text: 'Updates'),
            Divider(),
            _createDrawerItem(icon: Icons.extension, text: 'Plugins'),
            _createDrawerItem(icon: Icons.notifications, text: 'Notifications'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple], // Gradasi warna
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 8, // Efek bayangan
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/naruto.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Selamat Datang, Oneng!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text("Aplikasi Flutter dengan Drawer"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createDrawerItem({required IconData icon, required String text}) {
    return ListTile(leading: Icon(icon), title: Text(text), onTap: () {});
  }
}