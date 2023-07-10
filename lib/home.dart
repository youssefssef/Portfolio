// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menu = ['Project', 'Resume', 'Contact', 'About'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                    center: Alignment(0.5, 0.1),
                    colors: [
                      Colors.deepPurple,
                      Color.fromARGB(255, 58, 10, 143),
                    ],
                  )),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        title: Text(
                          'Serrar Youssef',
                          style: GoogleFonts.abrilFatface(),
                        ),
                        backgroundColor: Colors.transparent,
                        floating: true,
                        snap: true,
                        actions: <Widget>[
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
                                          return Colors.blue.withOpacity(0.8); // Change to your desired color
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
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Youssef Serrar'),
                            Align(
                                alignment: Alignment(-1, -1),
                                child: SizedBox(
                                  height: 900,
                                  child: Image.asset(
                                    'assets/profile.png',
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                height: 300,
                decoration: BoxDecoration(color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
