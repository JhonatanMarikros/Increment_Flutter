import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final List<Widget> page = [const Home(), const Setting()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Increments'),
        ),
        body: page[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting'),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int add = 0;

  void addCouunter() {
    setState(() {
      add++;
    });
  }

  void minCounter() {
    setState(() {
      add--;
    });
  }

  void reset() {
    setState(() {
      add = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: const Alignment(0.5, 0.5),
          children: [
          const Positioned(
              top: 180,
              right: 100,
              child: Image(
                image: AssetImage('image/calculator.png'),
                width: 200,
                height: 100,
              )),
          const Positioned(
            top: 290,
            right: 150,
            child: Text(
              'Increments',
              style: TextStyle(
                fontFamily: 'GrandHotel-Regular',
                fontSize: 30,
              ),
            ),
          ),
          Align(
              alignment: const Alignment(0, 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: addCouunter, child: const Text('Plus')),
                  ElevatedButton(
                      onPressed: minCounter, child: const Text('Min'))
                ],
              )),
          Positioned(
            top: 400,
            right: 190,
            child: Text(
              '$add',
              style: const TextStyle(fontSize: 20),
            ),
          )
        ],

        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        child: const Icon(Icons.restore),
      ),
    );
  }
}

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Kons'),
    );
  }
}
