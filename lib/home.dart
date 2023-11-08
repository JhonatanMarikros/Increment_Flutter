import 'package:flutter/material.dart';

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
              'Increment',
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