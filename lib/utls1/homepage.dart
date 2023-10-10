import 'dart:math';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int sec = 60;
  int min = 60;
  int hour = 12;

  bool isRunning = false;

  bool timer = false;
  bool straps = false;
  bool analog = false;
  bool digital = false;

  StartTimer() {
    if (isRunning) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          sec = DateTime.now().second;
          min = DateTime.now().minute;
          hour = DateTime.now().hour;
          StartTimer();
          setState(() {});
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clock App",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white12,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://e0.pxfuel.com/wallpapers/275/417/desktop-wallpaper-cartoon-dp-boy-for-whatsapp-cute-alone-etc-animation-boy.jpg"),
              ),
              accountName: Text("y"),
              accountEmail: Text("yashsarvaiya7978@gmail.com"),
            ),
            ListTile(
              title: const Text("Timer"),
              trailing: Switch(
                value: timer,
                onChanged: (val) {
                  setState(() {
                    timer = val;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Straps"),
              trailing: Switch(
                value: straps,
                onChanged: (val) {
                  setState(() {
                    straps = val;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Analog"),
              trailing: Switch(
                value: analog,
                onChanged: (val) {
                  setState(() {
                    analog = val;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Numbers"),
              trailing: Switch(
                value: digital,
                onChanged: (val) {
                  setState(() {
                    digital = val;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: timer || analog,
              child: Stack(
                children: List.generate(
                  60,
                  (index) => Transform.rotate(
                    angle: (index * (pi * 1)) / 2,
                    child: Divider(
                      thickness: (index % 5 == 01) ? 2 : 1,
                      color: (index % 5 == 0) ? Colors.red : Colors.black,
                      endIndent: (index % 5 == 0) ? w * 0.95 : w * 0.89,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: timer,
              child: Stack(
                children: [
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: sec * (pi * 2) / 60,
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        indent: 10,
                        endIndent: w / 2,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: min * (pi * 1) / 60,
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                        indent: 15,
                        endIndent: w / 1,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: hour * (pi * 8) / 12,
                      child: Divider(
                        color: Colors.black,
                        thickness: 3,
                        indent: 30,
                        endIndent: w / 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: straps,
              child: Stack(
                children: [
                  Transform.scale(
                    scale: 8,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: sec / 60,
                    ),
                  ),
                  Transform.scale(
                    scale: 5,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: min / 120,
                    ),
                  ),
                  Transform.scale(
                    scale: 4,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      value: hour / 12,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: analog,
              child: Stack(
                children: [],
              ),
            ),
            Visibility(
              visible: timer || analog,
              child: CircleAvatar(
                radius: 8,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (!isRunning) {
                isRunning = true;
                StartTimer();
              }
            },
            child: const Icon(Icons.macro_off),
          )
        ],
      ),
    );
  }
}
