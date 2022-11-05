// ignore_for_file: prefer_const_constructors

import 'package:about_fisayo/widgets/social_media_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

bool darkMode = true;

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool darkMode = false;

  void changeTheme() {
    setState(() {
      darkMode = !darkMode;
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 2, milliseconds: 500));
    _animationController.addListener(() {
      setState(() {});
    });
    if (mounted) _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'aboutFisayo',
        localizationsDelegates: const [
          AppLocalizationDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: const [Locale('en')],
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.blue,
            brightness: darkMode ? Brightness.dark : Brightness.light,
            primaryColor: Color(0xFF498EF9)),
        home: Builder(builder: (context) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 100
                        : 250,
                    child: Stack(
                      children: [
                        Positioned(
                          left: (1 - _animationController.value) *
                              (MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                  ? -100
                                  : -250),
                          child: Container(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black,
                            padding: const EdgeInsets.only(left: 8, top: 4),
                            child: Image.asset(
                              "assets/images/my_avatar.png",
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                  ? 100
                                  : 250,
                            ),
                          ),
                        ),
                        Positioned(
                            right: 16,
                            top: (1 - _animationController.value) * -24,
                            child: Text(
                              'Cyph3r',
                              style: GoogleFonts.raleway(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal),
                            )),
                        Positioned(
                          left: 4,
                          child: GestureDetector(
                            onTap: () => setState(() {
                              darkMode = !darkMode;
                            }),
                            child: darkMode
                                ? Icon(Icons.dark_mode)
                                : Icon(Icons.light_mode),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .8,
                          child: Text(
                            'Hi there. My name is',
                            style: GoogleFonts.raleway(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          'Ajai Fisayo (cypher)',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400, fontSize: 32),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'I am a mobile developer with 3 experience, when I '
                              'am not coding you will find me watching whatever movie I obsessed with at the moment ',
                              style: GoogleFonts.raleway(fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                        SocialMediaCard(), //social media links
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                            child: Text(
                          'With my experience I believe I can bring fresh I new ideas to the team',
                          style: GoogleFonts.raleway(fontSize: 20),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
