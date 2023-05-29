import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({Key? key}) : super(key: key);

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
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
  final carditem = [
    {
      "title": "The Pumkins Secrets",
      "imagePath": "citr",
      "word": "The Pumkins Secrets",
    },
    {
      "title": "The Pumkins Secrets",
      "imagePath": "citr",
      "word": "The Pumkins Secrets",
    },
    {
      "title": "The Pumkins Secrets",
      "imagePath": "citr",
      "word": "The Pumkins Secrets",
    },
  ];
  final listItem = [
    {
      "paragraph": "best vegetable recipes",
    },
    {
      "paragraph": "best vegetable recipes",
    },
    {
      "paragraph": "best vegetable recipes",
    },
    {
      "paragraph": "best vegetable recipes",
    },
    {
      "paragraph": "best vegetable recipes",
    },
    {
      "paragraph": "best vegetable recipes",
    },
    {
      "paragraph": "best vegetable recipes",
    },
  ];

  int isTyping = 0;

  void onTextFieldSubmitted(String text) {
    setState(() {
      isTyping = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Search",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Signika", fontSize: 20, color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 295,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/Search.svg',
                                  // Replace with the path to your SVG icon file
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter text...',
                                  ),
                                  onSubmitted: onTextFieldSubmitted,
                                  onChanged: (value) {
                                    setState(() {
                                      isTyping = 1;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*SizedBox(width: 50,height: 150,),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/images/Home.svg",
                                color: Color(0xFFD4D4D4),
                                width: 50,
                                height: 100,
                              ),
                              Text(
                                "No Results Found",
                                style: TextStyle(
                                  fontFamily: "Signika",
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        )*/
                      ],
                    ),
                  ],
                ),
              ),
              /*if(isTyping== 1)[
                Expanded(
                child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SvgPicture.asset(
                'assets/icon.svg',
                width: 100,
                height: 100,
                ),
                SizedBox(height: 16),
                Text(
                'Texte soumis',
                style: TextStyle(fontSize: 18),
                ),
                ],
                ),
                ),
                ),
                ];*/
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 35.0, top: 40.0),
                  ),
                  Text(
                    "Hot Now",
                    style: TextStyle(
                      fontFamily: "Signika-Bold",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(
                height: 200.0,
                margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: carditem.length,
                  itemBuilder: (context, index) {
                    final card = carditem[index];
                    final String? titre = card["title"];
                    final String? imagePathe = card["imagePath"];
                    final String? worde = card["word"];

                    return CardUnity(
                        title: titre!, imagePath: imagePathe!, word: worde!);
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 35.0, top: 40.0),
                  ),
                  Text(
                    "Trending",
                    style: TextStyle(
                      fontFamily: "Signika-Bold",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              /*Container(
                height: 200.0,
                margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: carditem.length,
                  itemBuilder: (context, index) {
                    final card = carditem[index];
                    final String? titre = card["title"];
                    final String? imagePathe = card["imagePath"];
                    final String? worde = card["word"];

                    return CardUnity(title: titre!, imagePath: imagePathe!, word: worde!);
                  },
                ),
              ),*/
              Container(
                height: 220.0,
                margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listItem.length,
                  itemBuilder: (context, index) {
                    final listItemIntermediaire = listItem[index];
                    final String? paragraph =
                        listItemIntermediaire["paragraph"];

                    return listUnity(title: paragraph!);
                  },
                ),
              ),
              /*Container(
                margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listItem.length,
                  itemBuilder: (context, index) {
                    final listItemIntermediaire = listItem[index];
                    final String? paragraph =listItemIntermediaire["paragraph"];
                    return Container(
                      child: Row(
                        children: [
                          Text(
                            paragraph!,
                            style: TextStyle(
                              fontFamily: "Signika",
                              fontSize: 16,
                              color: Color(0xFFFF8473),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/Vector.svg",
                            color: Color(0xFFFF8473),
                            width: 15.29,
                            height: 8,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),*/
            ],
          )
          /*Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: 295,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/images/Search.svg', // Replace with the path to your SVG icon file
                              width: 20,
                              height: 20,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter text...',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50,height: 150,),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/images/Home.svg",
                            color: Color(0xFFD4D4D4),
                            width: 50,
                            height: 100,
                          ),
                          Text(
                            "No Results Found",
                            style: TextStyle(
                              fontFamily: "Signika",
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )*/
          ),
    );
  }
}

class CardUnity extends StatelessWidget {
  final String title;
  final String imagePath;
  final String word;

  const CardUnity({
    required this.title,
    required this.imagePath,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 375.0,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFFF4F0F0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                //flex: 3,
                child: Container(
                  child: Image.asset(
                    "assets/images/$imagePath.png",
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                /*padding: EdgeInsets.only(
                top: 30.0,
                left: 10.0,
              ),*/
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      //padding: EdgeInsets.only(),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Signika-Bold',
                          //fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                /*padding: EdgeInsets.only(
                top: 30.0,
                left: 10.0,
              ),*/
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      //padding: EdgeInsets.only(left: 16, top: 10),
                      child: Text(
                        word,
                        style: TextStyle(
                          fontFamily: 'Signika',
                          fontSize: 9,
                          //fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class listUnity extends StatelessWidget {
  final String title;

  const listUnity({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 50.0,
      margin: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: "Signika",
              fontSize: 16,
              color: Color(0xFFFF8473),
            ),
          ),
          SvgPicture.asset(
            "assets/images/Vector.svg",
            color: Color(0xFFFF8473),
            width: 8,
            height: 8,
          ),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                //flex: 3,
                child: Container(
                  child: Image.asset(
                    "assets/images/$imagePath.png",
                    height: 150,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                /*padding: EdgeInsets.only(
                top: 30.0,
                left: 10.0,
              ),*/
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      //padding: EdgeInsets.only(),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Signika-Bold',
                          //fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                /*padding: EdgeInsets.only(
                top: 30.0,
                left: 10.0,
              ),*/
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      //padding: EdgeInsets.only(left: 16, top: 10),
                      child: Text(
                        word,
                        style: TextStyle(
                          fontFamily: 'Signika',
                          fontSize: 9,
                          //fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}

class TextfieldMouvement extends StatefulWidget {
  const TextfieldMouvement({Key? key}) : super(key: key);

  @override
  State<TextfieldMouvement> createState() => _TextfieldMouvementState();
}

class _TextfieldMouvementState extends State<TextfieldMouvement> {

  bool isTyping = false;

  void onTextFieldSubmitted(String text) {
    setState(() {
      isTyping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(

        )
    );
  }
}
