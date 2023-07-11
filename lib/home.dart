// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menu = ['Project', 'Resume', 'Contact', 'About'];
  List<Color> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 1, 101),
        title: Text(
          'Serrar Youssef',
          style: GoogleFonts.abrilFatface(),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(menu.length, (index) {
              return SizedBox(
                width: 200,
                child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Color.fromARGB(255, 80, 0, 240).withOpacity(0.8); // Change to your desired color
                        }
                        return Colors.transparent; // Use default color when not hovered
                      },
                    )),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        menu[index],
                        style: GoogleFonts.courgette(textStyle: TextStyle(color: Colors.white)),
                      ),
                    )),
              );
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 540,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  center: Alignment(0.4, 0.1),
                  radius: 0.4,
                  colors: [
                    const Color.fromARGB(255, 71, 71, 71),
                    Color.fromARGB(255, 86, 85, 85),
                    Color.fromARGB(255, 31, 1, 101),
                  ],
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment(2, -0.4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Serrar youssef',
                                  style: GoogleFonts.abrilFatface(textStyle: TextStyle(color: Colors.white, fontSize: 55)),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, left: 60),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText('FLUTTER  DEVELOPER',
                                        textStyle: GoogleFonts.libreBaskerville(textStyle: TextStyle(color: Colors.white, fontSize: 30)),
                                        speed: Duration(milliseconds: 100)),
                                  ],
                                  totalRepeatCount: 80,
                                  pause: const Duration(milliseconds: 500),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment(0.9, 0.1),
                          child: Container(
                            height: 600,
                            width: 980,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(image: AssetImage('assets/profile.png'), fit: BoxFit.cover)),
                          )),
                    ),
                  ],
                )),
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                            endIndent: 20,
                            indent: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Skills',
                          style: GoogleFonts.rubik(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                            endIndent: 20,
                            indent: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 10, // Number of items in the grid
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Number of columns
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(25.0),
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Item $index',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
