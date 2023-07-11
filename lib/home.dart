// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menu = ['Project', 'Resume', 'Contact', 'About'];
  List<String> skils = ["UI/UX", "FireBase", "API", "Github", "Git", "SQLite"];
  List<Image> skilsImage = [
    Image.asset('assets/ui.png'),
    Image.asset('assets/firebase.png'),
    Image.asset('assets/api.png'),
    Image.asset('assets/github.png'),
    Image.asset('assets/git.jpg'),
    Image.asset('assets/sQLite.jpg')
  ];
  late List<bool> _isHovered;
  final controller = FlipCardController();

  @override
  void initState() {
    super.initState();
    _isHovered = List.filled(6, false);
  }

  void _toggleHover(int index, bool isHovered) {
    setState(() {
      _isHovered[index] = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color defaultColor = Colors.white;
    Color containerhover = Color.fromARGB(255, 61, 4, 196);
    Color shadowColor = Colors.black.withOpacity(0.3);
    double shadowOffset = 5.0;
    double shadowBlurRadius = 5.0;

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
                width: MediaQuery.of(context).size.width / 8,
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
              color: Color.fromARGB(255, 238, 235, 235),
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
                      itemCount: skils.length, // Number of items in the grid
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 600
                            ? 4
                            : MediaQuery.of(context).size.width > 400
                                ? 3
                                : 2, // Number of columns
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return MouseRegion(
                          onEnter: (_) => _toggleHover(index, true),
                          onExit: (_) => _toggleHover(index, false),
                          child: FlipCard(
                            rotateSide: RotateSide.bottom,
                            onTapFlipping: true, //When enabled, the card will flip automatically when touched.
                            axis: FlipAxis.horizontal,
                            controller: controller,
                            frontWidget: Container(
                              margin: EdgeInsets.all(25.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: _isHovered[index]
                                      ? [
                                          BoxShadow(
                                            color: shadowColor,
                                            offset: Offset(shadowOffset, shadowOffset),
                                            blurRadius: shadowBlurRadius,
                                          ),
                                        ]
                                      : null,
                                  image: DecorationImage(image: skilsImage[index].image, fit: BoxFit.cover)),
                            ),
                            backWidget: Container(
                              margin: EdgeInsets.all(25.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _isHovered[index] ? containerhover : defaultColor,
                                boxShadow: _isHovered[index]
                                    ? [
                                        BoxShadow(
                                          color: shadowColor,
                                          offset: Offset(shadowOffset, shadowOffset),
                                          blurRadius: shadowBlurRadius,
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    skils[index],
                                    style: TextStyle(
                                      color: _isHovered[index] ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
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
