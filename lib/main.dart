import 'package:flutter/material.dart';
import 'package:flutterprojo/home_page.dart';
import 'package:flutterprojo/profile_page.dart';
import 'package:flutterprojo/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const Rootpage(),
    );
  }
}

class Rootpage extends StatefulWidget {
  const Rootpage({super.key});

  @override
  State<Rootpage> createState() => _RootpageState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _icondark = Icons.nightlight;



ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);
ThemeData _darkTheme = ThemeData(
 primarySwatch: Colors.deepOrange,
 brightness: Brightness.dark,
);

class _RootpageState extends State<Rootpage> {
  int currentPage = 0;
  List<Widget> pages = const  [
    
    Profile_Page(),
    HomePage(),
    API_showcase(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconbool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter showcase with API'),
          actions: [
            IconButton(onPressed:(){
              setState(() {
                _iconbool = !_iconbool;
              });
            } , icon: Icon(_iconbool ? _icondark : _iconLight))
          ],
        ),
        body: pages[currentPage],
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('Floating Action button');
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.info), label: 'About'),
             NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.api), label: 'API'),  
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ),
        ));
  }
}
