import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Search.dart';
import 'Profile.dart';
import 'Scanner.dart';
import 'Favorite.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeFragment(),
    SearchFragment(),
    ScannerFragment(),
    FavoriteFragment(),
    ProfileFragment(),
  ];

  List<String> svgAssets = [
    'assets/images/Home.svg',
    'assets/images/Search.svg',
    'assets/images/Scan.svg',
    'assets/images/Heart.svg',
    'assets/images/Profile.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(svgAssets.length, (index) {
          if (index == 2) {
            return BottomNavigationBarItem(
              icon: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF91C788),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    svgAssets[index],
                    color: Colors.white,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              label: '',
            );
          } else {
            return BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: SvgPicture.asset(
                  svgAssets[index],
                  color:
                      _currentIndex == index ? Color(0xFF91C788) : Colors.black,
                  width: 24,
                  height: 24,
                ),
              ),
              label: '',
            );
          }
        }),
      ),
    );
  }
}

class HomeFragment extends StatelessWidget {
  final List<CarouselItem> carouselItems = [
    CarouselItem(
        imagePath: 'assets/images/Group 1.svg',
        title: 'A R T I C L E',
        description: 'The pros and cons of fast food.',
        buttonMot: 'Read More ►'),
    CarouselItem(
        imagePath: 'assets/images/Group 1.svg',
        title: 'A R T I C L E',
        description: 'The pros and cons of fast food.',
        buttonMot: 'Read More ►'),
    CarouselItem(
        imagePath: 'assets/images/Group 1.svg',
        title: 'A R T I C L E',
        description: 'The pros and cons of fast food.',
        buttonMot: 'Read More ►'),
  ];
  /*final List<listItem> listItems = [
    listItem(
        imagePath: 'assets/images/Group 1.svg',
        title: 'A R T I C L E',
        couleur: 0xFF669696,
        couleurText: 0xFF999778,
    ),
    listItem(
        imagePath: 'assets/images/Group 1.svg',
        title: 'A R T I C L E',
        couleur: 0xFF669696
    ),
    listItem(
        imagePath: 'assets/images/Group 1.svg',
        title: 'A R T I C L E',
        couleur: 0xFF669696
    ),
  ];*/

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return Center(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        Center(
          child: Column(
            children: [
              Container(
                child: const Text(
                  "Hello Shambhavi,",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Signika',
                      color: Color(0xFF91C788),
                      letterSpacing: -0.24,
                      height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
              const Text(
                'Find, track and eat heathy food.',
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 18,
                  letterSpacing: -0.24,
                  height: 1.5,
                  //wordSpacing: 6,
                  color: const Color(0x73000000),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        CarouselSlider(
          items: carouselItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return CustomCard(
                    title: item.title,
                    sentence: item.description,
                    word: item.buttonMot);
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 210.0,
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
            activeColorOverride: (i) => Color(0xFFFF8473),
            inActiveColorOverride: (i) => Color(0xFFFFC0B8),
          ),
        ),
        Center(
          child: Container(
            width: 375.0,
            height: 100.0,
            margin: EdgeInsets.only(
              top: 15.0,
              bottom: 20.0,
              left: 15.0,
              right: 15.0,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFC6C4DE),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10.0,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Track Your   '
                        'Weekly Progress',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Signika-Bold',
                          fontSize: 17,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(10, 10))),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(
                          Colors.white,
                        ),
                      ),
                      child: const Text(
                        'View Now ►',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9E9BC7),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "      Choose Your Favorites",
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Signika',
              color: Colors.black,
              letterSpacing: -0.24,
            ),
          ),
        ),
        /*CarouselSlider(
          items: listItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return CustomCardList(
                    title: item.title,
                    imagePath: item.imagePath,
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 100.0,
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            autoPlay: false,
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
        ),*/
        Container(
          height: 100.0,
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 15.0)
                ),
                Container(
                  width: 125.0,
                  height: 50,
                  //color: Color(0xFFABB121),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF2F0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/fruit.svg",
                          width: 50,
                          height: 75,
                        ),
                        const Text(
                          "Fruits",
                          style: TextStyle(
                            fontFamily: 'Signika',
                            fontSize: 20,
                            letterSpacing: -0.24,
                            height: 1,
                            color: Color(
                                0xFF141214
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15.0)
                ),
                Container(
                  width: 125.0,
                  height: 100,
                  //color: Color(0xFFABB121),
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF7EE),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/vegetable.svg",
                          width: 50,
                          height: 75,
                        ),
                        const Text(
                          "Vegetables",
                          style: TextStyle(
                            fontFamily: 'Signika',
                            fontSize: 15,
                            letterSpacing: -0.24,
                            height: 1,
                            color: Color(
                                0xFF91C788
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15.0)
                ),
                Container(
                  width: 125.0,
                  height: 100,
                  //color: Color(0xFFABB121),
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF7EE),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/Cooking-cuate 1.svg",
                          width: 50,
                          height: 75,
                        ),
                        const Text(
                          "Vegetables",
                          style: TextStyle(
                            fontFamily: 'Signika',
                            fontSize: 15,
                            letterSpacing: -0.24,
                            height: 1,
                            color: Color(
                                0xFF91C788
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    ));
  }
}

/*class CustomCardList extends StatelessWidget {
  final String title;
  final String imagePath;
  final int couleur;
  final int couleurText;

  const CustomCardList({
    required this.title,
    required this.imagePath,
    required this.couleur,
    required this.couleurText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 150.0,
      margin: EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
        left: 15.0,
        right: 15.0,
      ),
      decoration: BoxDecoration(
        color: Color(couleur),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Signika',
                color: Color(couleurText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/



class CarouselItem {
  final String imagePath;
  final String title;
  final String description;
  final String buttonMot;

  CarouselItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonMot,
  });
}

/*class listItem {
  final String imagePath;
  final String title;
  final int couleur;
  final int couleurTitre;

  listItem({
    required this.imagePath,
    required this.title,
    required this.couleur,
    required this.couleurTitre,
  });
}*/

class CustomCard extends StatelessWidget {
  final String title;
  final String sentence;
  final String word;

  const CustomCard({
    required this.title,
    required this.sentence,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.0,
      height: 500.0,
      margin: EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
        left: 15.0,
        right: 15.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFFFF2F0), Color(0xFFFFF8EB)],
          stops: [0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(
                top: 30.0,
                left: 10.0,
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 9.0,
                        fontFamily: 'Signika-Bold',
                        //fontWeight: FontWeight.bold,
                        color: Color(0xFFFF806E),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, top: 10),
                    child: Text(
                      sentence,
                      style: TextStyle(
                        fontFamily: 'Signika-Bold',
                        fontSize: 17,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFF8473),
                    ),
                    child: Text(word),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/images/Group 1.svg",
                width: 250,
                height: 125,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListCard extends StatefulWidget {
  const ListCard({Key? key}) : super(key: key);
  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  final cards = [
    {
      "svgnom": "Mobile-cuate 1",
    },
    {
      "svgnom": "Cooking-cuate 1",
    },
    {
      "svgnom": "Eating healthy food-cuate 1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        final card = cards[index];
        final svgnom = card["svgnom"];

        return Container(
          width: 175.0,
          height: 200.0,
          color: Color(index == 1
              ? 0xFFABB121
              : index == 2
                  ? 0xFF876545
                  : 0xFF141214),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/images/$svgnom.svg",
                  width: 10,
                  height: 10,
                ),
                Text(
                  index == 1
                      ? "Vegetables"
                      : index == 2
                          ? "Strech"
                          : "Fruits",
                  style: TextStyle(
                    fontFamily: 'Signika',
                    fontSize: 10,
                    letterSpacing: -0.24,
                    height: 3,
                    color: Color(index == 1
                        ? 0xFFABB121
                        : index == 2
                            ? 0xFF876545
                            : 0xFF141214),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}




/*class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  List<String> svgAssets = [
    'assets/images/Home.svg',
    'assets/images/Search.svg',
    'assets/images/Scan.svg',
    'assets/images/Heart.svg',
    'assets/images/Profile.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text('Content of tab $_currentIndex'),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(svgAssets.length, (index) {
          return BottomNavigationBarItem(
            backgroundColor: index == 2 ? Color(0xFF91C788) : Colors.white,
            decoration: index == 2 ? BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF91C788),
            ) : null,
            icon: SvgPicture.asset(
              svgAssets[index],
              color: _currentIndex == index ? Color(0xFF91C788) : Colors.black,
            ),
            label: '',
          );
        }),
      ),*/
      /*bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: index == 2 ? BoxShape.circle : BoxShape.rectangle,
                  color: index == 2 ? Colors.green : Colors.white,
                ),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: SvgPicture.asset(
                    svgAssets[index],
                    color: index == 2 ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }),
        ),
      ),*/
      /*bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(svgAssets.length, (index) {
          return BottomNavigationBarItem(
            icon: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Color(0xFF91C788) : Colors.transparent,
              ),
              child: Center(
                child: SvgPicture.asset(
                  svgAssets[index],
                  color: _currentIndex == index ? Colors.white : Colors.black,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            label: '',
          );
        }),
      ),*/
      /*bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(svgAssets.length, (index) {
          if (index == 2) {
            return BottomNavigationBarItem(
              icon: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF91C788),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    svgAssets[index],
                    color: Colors.white,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              label: '',
            );
          } else {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                svgAssets[index],
                color: Colors.black,
                width: 24,
                height: 24,
              ),
              label: '',
            );
          }
        }),
      ),*/
      /*bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: List.generate(svgAssets.length, (index) {
        if (index == 2) {
          return BottomNavigationBarItem(
            icon: _currentIndex == index
                ? Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF91C788),
              ),
              child: Center(
                child: SvgPicture.asset(
                  svgAssets[index],
                  color: Colors.white,
                  width: 24,
                  height: 24,
                ),
              ),
            )
                : Container(
              width: 56,
              height: 56,
              child: Center(
                child: SvgPicture.asset(
                  svgAssets[index],
                  color: Colors.black,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            label: '',
          );
        } else {
          return BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: SvgPicture.asset(
                svgAssets[index],
                color: _currentIndex == index ? Color(0xFF91C788) : Colors.black,
                width: 24,
                height: 24,
              ),
            ),
            label: '',
          );
        }
      }),
    ),*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: List.generate(svgAssets.length, (index) {
          if (index == 2) {
            return BottomNavigationBarItem(
              icon: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF91C788),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    svgAssets[index],
                    color: Colors.white,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              label: '',
            );
          } else {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                svgAssets[index],
                color: Colors.black,
                width: 24,
                height: 24,
              ),
              label: '',
            );
          }
        }),
      ),
    );
  }
}*/
