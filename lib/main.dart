import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class OnboardingUn extends StatelessWidget {

  OnboardingUn({Key? key}) : super(key: key);

  final List<CarouselItem> carouselItems = [
    CarouselItem(
      imagePath: 'assets/images/Eating healthy food-cuate 1.svg',
      title: 'Eat Healthy',
      description: 'Maintaining good health should be the primary focus of everyone.',
    ),
    CarouselItem(
      imagePath: 'assets/images/Cooking-cuate 1.svg',
      title: 'Healthy Recipes',
      description: 'Browse thousands of healthy recipes from all over the world.',
    ),
    CarouselItem(
      imagePath: 'assets/images/Mobile-cuate 1.svg',
      title: 'Track Your Health',
      description: 'With amazing inbuilt tools you can track your progress.',
    ),


  ];
  final controller = PageController(viewportFraction: 0.5, keepPage: true);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 65),
              ),
              Container(
                //margin: const EdgeInsets.only(top: 88.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    "assets/images/kcal.svg",
                    color: const Color(0xFF91C788),
                    width: 58.29,
                    height: 24,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              CarouselSlider(
                items: carouselItems.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              item.imagePath,
                              width: 281,
                              height: 281,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              item.title,
                              style: TextStyle(
                                fontFamily: 'Signika-Bold',
                                fontSize: 25,
                                letterSpacing: -0.24,
                                height: 3,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                item.description,
                                style: TextStyle(
                                  fontFamily: 'Signika',
                                  fontSize: 17,
                                  letterSpacing: -0.24,
                                  height: 1.5,
                                  //wordSpacing: 6,
                                  color: const Color(0x73000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 421.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    controller.animateToPage(
                      index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                  aspectRatio: 16 / 9,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              SmoothPageIndicator(
               controller: controller,
               count: carouselItems.length,
               effect: CustomizableEffect(
                 activeDotDecoration: DotDecoration(
                   width: 30,
                   height: 12,
                   color: Color(0xFFFF8473),
                   rotationAngle: 180,
                   //verticalOffset: -10,
                   borderRadius: BorderRadius.circular(24),
                   // dotBorder: DotBorder(
                   //   padding: 2,
                   //   width: 2,
                   //   color: Colors.indigo,
                   // ),
                 ),
                 dotDecoration: const DotDecoration(
                   width: 22,
                   height: 12,
                   color: Color(0xFFFFC0B8),
                   // dotBorder: DotBorder(
                   //   padding: 2,
                   //   width: 2,
                   //   color: Colors.grey,
                   // ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)),
                   //borderRadius: BorderRadius.circular(16),
                   verticalOffset: 0,
                 ),
                 spacing: 6.0,
                 // activeColorOverride: (i) => colors[i],
                 inActiveColorOverride: (i) => Color(0xFFFFC0B8),
               ),
             ),
              Padding(
                padding: EdgeInsets.only(top: 42),
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(290, 72)),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFF91C788),
                      ),
                      elevation: const MaterialStatePropertyAll(0),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(24, 24))),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => Home()));
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Signika',
                        color: Color(0xFFFFFFFF),
                        letterSpacing: -0.24,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Container(
                      margin: const EdgeInsets.only(left: 55.0),
                      child: const Text(
                        "Already Have An Acount? ",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Signika',
                            color: Color(0xFF73000000),
                            letterSpacing: -0.24,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Action when the button is pressed
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Signika',
                            color: Color(0xFF91C788
                            ),
                            letterSpacing: -0.24,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    /*TextButton(
                      onPressed: () {
                        // Action when the button is pressed
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Signika',
                            color: Color(0xFF91C788
                            ),
                            letterSpacing: -0.24,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),*/
                    /*Container(
                      //margin: const EdgeInsets.only(left: 2.0),
                      child:
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingUnUn extends StatefulWidget {
  @override
  State<OnboardingUnUn> createState() => _OnboardingUnUnState();
}

class _OnboardingUnUnState extends State<OnboardingUnUn> {
  final List<CarouselItem> carouselItems = [
  CarouselItem(
  imagePath: 'assets/images/Eating healthy food-cuate 1.svg',
  title: 'Eat Healthy',
  description: 'Maintaining good health should be the primary focus of everyone.',
  ),
  CarouselItem(
  imagePath: 'assets/images/Cooking-cuate 1.svg',
  title: 'Healthy Recipes',
  description: 'Browse thousands of healthy recipes from all over the world.',
  ),
  CarouselItem(
  imagePath: 'assets/images/Mobile-cuate 1.svg',
  title: 'Track Your Health',
  description: 'With amazing inbuilt tools you can track your progress.',
  ),
  ];
  PageController controller = PageController(initialPage: 0);
  //PageController controller = PageController(viewportFraction: 0.5, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 65),
              ),
              Container(
                //margin: const EdgeInsets.only(top: 88.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    "assets/images/kcal.svg",
                    color: const Color(0xFF91C788),
                    width: 58.29,
                    height: 24,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              CarouselSlider(
                items: carouselItems.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              item.imagePath,
                              width: 281,
                              height: 281,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              item.title,
                              style: TextStyle(
                                fontFamily: 'Signika-Bold',
                                fontSize: 25,
                                letterSpacing: -0.24,
                                height: 3,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                item.description,
                                style: TextStyle(
                                  fontFamily: 'Signika',
                                  fontSize: 17,
                                  letterSpacing: -0.24,
                                  height: 1.5,
                                  //wordSpacing: 6,
                                  color: const Color(0x73000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 421.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    controller.animateToPage(
                      index,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.ease,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                  aspectRatio: 16 / 9,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: carouselItems.length,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: 30,
                    height: 12,
                    color: Color(0xFFFF8473),
                    rotationAngle: 180,
                    //verticalOffset: -10,
                    borderRadius: BorderRadius.circular(24),
                    // dotBorder: DotBorder(
                    //   padding: 2,
                    //   width: 2,
                    //   color: Colors.indigo,
                    // ),
                  ),
                  dotDecoration: const DotDecoration(
                    width: 22,
                    height: 12,
                    color: Color(0xFFFFC0B8),
                    // dotBorder: DotBorder(
                    //   padding: 2,
                    //   width: 2,
                    //   color: Colors.grey,
                    // ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)),
                    //borderRadius: BorderRadius.circular(16),
                    verticalOffset: 0,
                  ),
                  spacing: 6.0,
                  // activeColorOverride: (i) => colors[i],
                  inActiveColorOverride: (i) => Color(0xFFFFC0B8),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 42),
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize:
                      MaterialStateProperty.all(const Size(290, 72)),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFF91C788),
                      ),
                      elevation: const MaterialStatePropertyAll(0),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.elliptical(24, 24))),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, __, ___) => Home()));
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Signika',
                        color: Color(0xFFFFFFFF),
                        letterSpacing: -0.24,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 55.0),
                      child: const Text(
                        "Already Have An Acount? ",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Signika',
                            color: Color(0xFF73000000),
                            letterSpacing: -0.24,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Action when the button is pressed
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Signika',
                            color: Color(0xFF91C788
                            ),
                            letterSpacing: -0.24,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    /*TextButton(
                      onPressed: () {
                        // Action when the button is pressed
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Signika',
                            color: Color(0xFF91C788
                            ),
                            letterSpacing: -0.24,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),*/
                    /*Container(
                      //margin: const EdgeInsets.only(left: 2.0),
                      child:
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  //const SplashScreen({super.key});
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Utilisez Future.delayed pour ajouter un délai de 2 secondes avant de passer à la page suivante
    Future.delayed(const Duration(seconds: 2), () {
      // Utilisez Navigator.pushReplacement pour passer à votre page suivante
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  OnboardingUnUn()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF91C788),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: SvgPicture.asset(
                        "assets/images/kcal.svg",
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "ZUAMICA",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Nunito',
                      color: Color(0xFFCFE7CB),
                      letterSpacing: -0.01),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselItem {
  final String imagePath;
  final String title;
  final String description;

  CarouselItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

/*class OnboardingUn extends StatefulWidget {
  @override
  _OnboardingUnState createState() => _OnboardingUnState();
}

class _OnboardingUnState extends State<OnboardingUn> {
  final List<CmsBlock> blocks = [
    CmsBlock(
      title: 'Eat Healthy',
      svgPath: 'assets/images/Eating healthy food-cuate 1.svg',
      description: 'Maintaining good health should be the primary focus of everyone.',
    ),
    CmsBlock(
        title: 'Healthy Recipes',
        svgPath: 'assets/images/Cooking-cuate 1.svg',
        description: 'Browse thousands of healthy recipes from all over the world.',
    ),
    CmsBlock(
      title: 'Track Your Health',
      svgPath: 'assets/images/Mobile-cuate 1.svg',
      description: 'With amazing inbuilt tools you can track your progress.',
    ),
  ];

  final CarouselController _carouselController = CarouselController();
  final controller = PageController(viewportFraction: 0.5, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 65),
            ),
            Container(
              //margin: const EdgeInsets.only(top: 88.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  "assets/images/kcal.svg",
                  color: const Color(0xFF91C788),
                  width: 58.29,
                  height: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            CarouselSlider(
              carouselController: _carouselController,
              items: blocks.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            item.svgPath,
                            width: 281,
                            height: 281,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            item.title,
                            style: TextStyle(
                              fontFamily: 'Signika-Bold',
                              fontSize: 25,
                              letterSpacing: -0.24,
                              height: 3,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              item.description,
                              style: TextStyle(
                                fontFamily: 'Signika',
                                fontSize: 17,
                                letterSpacing: -0.24,
                                height: 1.5,
                                //wordSpacing: 6,
                                color: const Color(0x73000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 421.0,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {
                  controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                scrollDirection: Axis.horizontal,
                viewportFraction: 1,
                aspectRatio: 16 / 9,
              ),
            ),
            /*CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 421.0,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: blocks.map((block) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            block.svgPath,
                            width: 281,
                            height: 281,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            block.title,
                            style: TextStyle(
                              fontFamily: 'Signika-Bold',
                              fontSize: 25,
                              letterSpacing: -0.24,
                              height: 3,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            block.description,
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 17,
                              letterSpacing: -0.24,
                              height: 1.5,
                              color: Color(0x73000000),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),*/
            SmoothPageIndicator(
              controller: controller,
              count: blocks.length,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 30,
                  height: 12,
                  color: Color(0xFFFF8473),
                  rotationAngle: 180,
                  //verticalOffset: -10,
                  borderRadius: BorderRadius.circular(24),
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.indigo,
                  // ),
                ),
                dotDecoration: const DotDecoration(
                  width: 22,
                  height: 12,
                  color: Color(0xFFFFC0B8),
                  // dotBorder: DotBorder(
                  //   padding: 2,
                  //   width: 2,
                  //   color: Colors.grey,
                  // ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                  //borderRadius: BorderRadius.circular(16),
                  verticalOffset: 0,
                ),
                spacing: 6.0,
                // activeColorOverride: (i) => colors[i],
                inActiveColorOverride: (i) => Color(0xFFFFC0B8),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                    MaterialStateProperty.all(const Size(290, 72)),
                    backgroundColor: const MaterialStatePropertyAll(
                      Color(0xFF91C788),
                    ),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.elliptical(24, 24))),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => OnboardingDeux()));
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Signika',
                      color: Color(0xFFFFFFFF),
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Container(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 55.0),
                    child: const Text(
                      "Already Have An Acount? ",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Signika',
                          color: Color(0xFF73000000),
                          letterSpacing: -0.24,
                          height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5.0),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Signika',
                          color: Color(0xFF91C788
                          ),
                          letterSpacing: -0.24,
                          height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CmsBlock {
  final String title;
  final String svgPath;
  final String description;

  CmsBlock({required this.title, required this.svgPath, required this.description});
}*/
