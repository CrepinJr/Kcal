import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileFragment extends StatelessWidget {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Profile",
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
              Padding(padding: EdgeInsets.only(top: 30)),
              Center(
                child: CircleAvatar(
                  radius: 100,
                  // The radius of the circle avatar
                  backgroundImage: AssetImage('assets/images/Ellipse 8.png'),
                  // The image for the avatar
                  backgroundColor: Colors
                      .blue, // The background color of the avatar if no image is provided
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Center(
                child: Text(
                  "Shambhavi Mishra",
                  style: TextStyle(fontSize: 25, fontFamily: "Signika-Bold"),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Center(
                child: Text(
                  "Food Blogger",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Signika",
                      color: Color(0xFFA1A1A1)),
                ),
              ),
              Container(
                height: 220.0,
                margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.only(bottom: 5),
                      child: ListTile(

                        leading: Container(
                          color: Color(0xFFFFF8EE),
                          child: SvgPicture.asset(
                            "assets/images/Profile.svg",
                            width: 28,
                            height: 28,
                            color: Color(0xFF130F26),
                          ),
                        ),
                        title: Text(
                          'Edit profile',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Signika",
                              color: Color(0xFFEE6A50)),
                        ),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}
