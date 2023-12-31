// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/resume.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menu = ['Project', 'Resume', 'Contact', 'About'];
  List<String> skils = ["UI/UX", "FireBase", "API", "Github", "Git", "SQLite", "Hive"];
  List<String> skilsDesription = [
    'Crafting Seamless and Engaging Flutter Experiences',
    "Empowering Flutter Apps with Real-time Database & Authentication & Notification",
    'API Integration Proficiency: Enhancing Flutter Apps with Seamless Data Connectivity',
    "GitHub Repository: Showcasing my Flutter Development Skills",
    "Git Proficiency: Streamlining Collaboration and Version Control",
    "SQLite Mastery: Efficient Data Management for Flutter Applications",
    "Efficient Data Storage with Hive: Powering Flutter Apps with Lightweight NoSQL Database"
  ];
  List<String> contact = [
    'Address ',
    'Email',
    'Phone',
  ];
  List<String> contactDetails = ['Maroc, Casabblanca, Lissasfa Rid Sofia', 'yousssef.serrar@gmail.com', '+2126 3504 6545'];
  List<Icon> contacticon = [
    Icon(
      Icons.fmd_good,
      color: Colors.white,
    ),
    Icon(Icons.email, color: Colors.white),
    Icon(Icons.phone_android, color: Colors.white)
  ];
  List<Image> skilsImage = [
    Image.asset('assets/ui.png'),
    Image.asset('assets/firebase.png'),
    Image.asset('assets/api.png'),
    Image.asset('assets/github.png'),
    Image.asset('assets/git.jpg'),
    Image.asset('assets/sQLite.jpg'),
    Image.asset('assets/hive.png')
  ];
  List<String> socialImage = [
    'assets/facebook.png',
    'assets/instagram.png',
    'assets/github1.png',
    'assets/linkedin.png',
  ];
  List<Color> socialColors = [Color.fromARGB(255, 0, 24, 232), Color.fromARGB(255, 162, 2, 254), Colors.white, Colors.blue];
  List<String> socialUrl = [
    'https://www.facebook.com/youssef.ssef.3',
    'https://www.instagram.com/josephssef/',
    'https://github.com/youssefssef',
    'https://www.linkedin.com/in/serrar-youssef-123128211/'
  ];

  late List<bool> _isHovered;
  late List<bool> _hovered;
  final controller = FlipCardController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _isHovered = List.filled(skils.length, false);
    _hovered = List.filled(socialImage.length, false);
  }

  void _toggleHover(int index, bool isHovered) {
    setState(() {
      _isHovered[index] = isHovered;
    });
  }

  void _toggleIsHover(int index, bool hovered) {
    setState(() {
      _hovered[index] = hovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color defaultColor = Colors.white;
    Color containerhover = Color.fromARGB(255, 143, 107, 228);
    Color shadowColor = Colors.black.withOpacity(0.3);
    double shadowOffset = 5.0;
    double shadowBlurRadius = 5.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 1, 101),
        automaticallyImplyLeading: false,
        title: TextButton(
            onPressed: () {
              Get.to(HomePage());
            },
            child: Text(
              'Serrar Youssef',
              style: GoogleFonts.abrilFatface(color: Colors.white, fontSize: 20),
            )),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(menu.length, (index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 8,
                child: TextButton(
                    onPressed: () {
                      if (menu[index] == 'Contact' || menu[index] == 'About') {
                        _scrollToBottom();
                      } else if (menu[index] == 'Resume') {
                        Get.to(ResumePage());
                      }
                    },
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
        controller: _scrollController,
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
              height: 800,
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
                      padding: EdgeInsets.all(40),
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
                            rotateSide: RotateSide.right,

                            onTapFlipping: true, //When enabled, the card will flip automatically when touched.
                            axis: FlipAxis.vertical,
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
                                  child: Column(
                                    children: [
                                      Text(
                                        skils[index],
                                        style: TextStyle(
                                          color: _isHovered[index] ? Colors.white : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        width: 280,
                                        child: Text(
                                          skilsDesription[index],
                                          style: TextStyle(
                                            color: _isHovered[index] ? Colors.white : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
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
            ),
            Container(
              constraints: BoxConstraints(minHeight: 400, maxHeight: double.infinity),
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 31, 1, 101),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'About',
                          style: GoogleFonts.rubik(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Divider(
                            color: const Color.fromARGB(255, 231, 226, 226),
                            thickness: 1,
                            endIndent: 20,
                            indent: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Contact',
                          style: GoogleFonts.rubik(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Divider(
                            color: const Color.fromARGB(255, 231, 226, 226),
                            thickness: 1,
                            endIndent: 20,
                            indent: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 55.0, top: 40),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  constraints: BoxConstraints(minHeight: 200, maxHeight: double.infinity),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0, top: 15, right: 10),
                                    child: Text(
                                      "I am a dedicated Flutter developer with a passion for crafting seamless and engaging mobile applications. With a keen eye for design and a solid understanding of Flutter's cross-platform capabilities, I am committed to delivering exceptional user experiences. From sleek UI designs to efficient code implementation, I strive to bring innovative ideas to life and exceed expectations. Let's collaborate and create remarkable Flutter experiences together.",
                                      style: GoogleFonts.ptSerif(fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 10),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage('assets/profile2.jpg'), fit: BoxFit.cover),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    itemCount: contact.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20.0),
                                            child: Text(
                                              '${contact[index]} :',
                                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              contacticon[index],
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0, top: 5),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width / 3,
                                                  child: Text(
                                                    contactDetails[index],
                                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Your Mobile development Solution',
                            style: GoogleFonts.alegreya(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: socialImage.length,
                              itemBuilder: ((context, index) {
                                return MouseRegion(
                                  onEnter: (_) => _toggleIsHover(index, true),
                                  onExit: (_) => _toggleIsHover(index, false),
                                  child: GestureDetector(
                                    onTap: () async {
                                      String url = socialUrl[index];
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          // Change the color based on the 'isHovered' state
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Image.asset(
                                          socialImage[index],
                                          scale: 15,
                                          color: _hovered[index] ? socialColors[index] : null,
                                        )),
                                  ),
                                );
                              })),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.copyright,
                              color: Colors.white,
                              size: 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Youssef Serrar',
                                style: GoogleFonts.alegreya(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
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
