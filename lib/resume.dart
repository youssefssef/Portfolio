// ignore_for_file: unused_element, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  List<String> menu = ['Project', 'Resume', 'Contact', 'About'];
  List<String> contact = [
    'Address ',
    'Email',
    'Phone',
  ];
  List<String> contactDetails = ['Maroc, Casabblanca, Lissasfa Rid Sofia', 'yousssef.serrar@gmail.com', '+2126 3504 6545'];

  List<Icon> contacticon = [
    const Icon(
      Icons.fmd_good,
      color: Colors.white,
    ),
    const Icon(Icons.email, color: Colors.white),
    const Icon(Icons.phone_android, color: Colors.white)
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
  late List<bool> _hovered;
  late bool _isHovered1 = false;
  late bool _isHovered2 = false;

  final controller = FlipCardController();
  final ScrollController _scrollController = ScrollController();
  String pdfPath = 'file:///C:/Users/Youssef%20Ssef/Documents/Resume/flutter_resume.pdf';

  void _toggleIsHover(int index, bool hovered) {
    setState(() {
      _hovered[index] = hovered;
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _toggleIsHover1(bool hover) {
    setState(() {
      _isHovered1 = hover;
    });
  }

  void _toggleIsHover2(bool hover2) {
    setState(() {
      _isHovered2 = hover2;
    });
  }

  @override
  void initState() {
    super.initState();

    _hovered = List.filled(socialImage.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 1, 101),
        automaticallyImplyLeading: false,
        title: TextButton(
            onPressed: () {
              Get.to(const HomePage());
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
                      }
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return const Color.fromARGB(255, 80, 0, 240).withOpacity(0.8); // Change to your desired color
                        }
                        return Colors.transparent; // Use default color when not hovered
                      },
                    )),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        menu[index],
                        style: GoogleFonts.courgette(textStyle: const TextStyle(color: Colors.white)),
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
              constraints: const BoxConstraints(minHeight: 1000, maxHeight: double.infinity),
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 24.0),
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
                          'My Resume',
                          style: GoogleFonts.rubik(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 24.0),
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
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 800,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: ListView(children: [
                      Container(
                        height: 1400,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                        child: SfPdfViewer.asset(
                          'assets/flutter_resume.pdf',
                          scrollDirection: PdfScrollDirection.vertical,
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MouseRegion(
                          onEnter: (_) => _toggleIsHover1(true),
                          onExit: (_) => _toggleIsHover1(false),
                          child: InkWell(
                            onTap: () {
                              String pdfUrl = 'https://drive.google.com/file/d/1SjmyPx3Fime0_fmofACb4yDjFK6ZZ4rI/view?usp=sharing';
                              _downloadPDF(pdfUrl);
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 7.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: _isHovered1 ? const Color.fromARGB(255, 32, 4, 247) : Colors.white,
                                  border: Border.all(color: _isHovered1 ? const Color.fromARGB(255, 32, 4, 247) : Colors.grey)),
                              child: Center(
                                  child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Download Resume',
                                    style: TextStyle(color: _isHovered1 ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        MouseRegion(
                          onEnter: (_) => _toggleIsHover2(true),
                          onExit: (_) => _toggleIsHover2(false),
                          child: InkWell(
                            onTap: () {
                              String pdfUrl = 'https://drive.google.com/file/d/1toDimhKqyOOiYxs2FmzZHVuPEQsMy9Dl/view?usp=sharing';
                              _downloadPDF(pdfUrl);
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 7.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: _isHovered2 ? const Color.fromARGB(255, 32, 4, 247) : Colors.white,
                                  border: Border.all(color: _isHovered2 ? const Color.fromARGB(255, 32, 4, 247) : Colors.grey)),
                              child: Center(
                                  child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Telecharger CV ',
                                    style: TextStyle(color: _isHovered2 ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 400, maxHeight: double.infinity),
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 31, 1, 101),
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
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 24.0),
                          child: Divider(
                            color: Color.fromARGB(255, 231, 226, 226),
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
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 24.0),
                          child: Divider(
                            color: Color.fromARGB(255, 231, 226, 226),
                            thickness: 1,
                            endIndent: 20,
                            indent: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
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
                                  constraints: const BoxConstraints(minHeight: 200, maxHeight: double.infinity),
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
                                  decoration: const BoxDecoration(
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
                                              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(height: 15),
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
                                                    style: const TextStyle(color: Colors.white, fontSize: 16),
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
                                      // ignore: deprecated_member_use
                                      if (await canLaunch(url)) {
                                        // ignore: deprecated_member_use
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
                            const Icon(
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

  Future<void> _downloadPDF(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
