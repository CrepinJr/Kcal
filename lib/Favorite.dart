import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteFragment extends StatefulWidget {
  const FavoriteFragment({Key? key}) : super(key: key);

  @override
  State<FavoriteFragment> createState() => _FavoriteFragmentState();
}

class _FavoriteFragmentState extends State<FavoriteFragment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Favorites",
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
            Row(
              children: [
                Center(
                  child: Container(

                  ),
                )
              ],
            ),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/Search.svg",
                    width: 15,
                    height: 15,
                  ),
                  const Text(
                    "No Foods Found",
                    style: TextStyle(
                      fontFamily: "Signika-Bold",
                      fontSize: 12,
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




