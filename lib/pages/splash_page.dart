import 'package:flutter/material.dart';
import 'package:project_cozy/pages/home_page.dart';
import 'package:project_cozy/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/bottom.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Find Cozy House\nto Stay and Happy",
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                    style: greyTextStyle.copyWith(fontSize: 16)),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 210,
                  child: RaisedButton(
                    color: purpleColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    child: Text(
                      "Explore Now",
                      style: whiteTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
