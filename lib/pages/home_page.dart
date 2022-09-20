import 'package:flutter/material.dart';
import 'package:project_cozy/models/city.dart';
import 'package:project_cozy/models/space.dart';
import 'package:project_cozy/models/tips.dart';
import 'package:project_cozy/providers/space_provider.dart';
import 'package:project_cozy/widgets/space_card.dart';
import 'package:project_cozy/theme.dart';
import 'package:project_cozy/widgets/city_card.dart';
import 'package:project_cozy/widgets/tips_card.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_navbar_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              SizedBox(height: edge),
              // NOTE: TITLE/HEADER
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Explore Now",
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Mencari kosan yang cozy",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // NOTE: POPULAR CITIES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text("Popular Cities",
                    style: regulerTextStyle.copyWith(fontSize: 16)),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  const SizedBox(width: 24),
                  CityCard(
                    City(id: 1, name: 'Jakarta', imageUrl: 'assets/city1.png'),
                  ),
                  const SizedBox(width: 20),
                  CityCard(
                    City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopular: true),
                  ),
                  const SizedBox(width: 20),
                  CityCard(
                    City(id: 3, name: 'Surabaya', imageUrl: 'assets/city3.png'),
                  ),
                  const SizedBox(width: 20),
                  CityCard(City(
                      id: 4, name: 'Palembang', imageUrl: 'assets/city4.png')),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/city5.png',
                      isPopular: true)),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                      City(id: 6, name: 'Bogor', imageUrl: 'assets/city6.png')),
                  const SizedBox(
                    width: 24,
                  )
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              // NOTE RECOMMENDED SPACE ///
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text("Recommended Space",
                    style: regulerTextStyle.copyWith(fontSize: 16)),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: FutureBuilder(
                      future: spaceProvider.getRecommendedSpaces(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Space> data = snapshot.data as List<Space>;

                          int index = 0;

                          return Column(
                              children: data.map((item) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(
                                top: index == 1
                                    ? 0
                                    : 30, // melakukan pengkondisian
                              ),
                              child: SpaceCard(item),
                            );
                          }).toList());
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
              const SizedBox(
                height: 30,
              ),
              // NOTE : TIPS AND GUIDANCE
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text("Tips & Guidance",
                    style: regulerTextStyle.copyWith(fontSize: 16)),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: Column(children: [
                  TipsCard(Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/tips1.png',
                      updateAt: '20 Apr')),
                  const SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      imageUrl: 'assets/tips2.png',
                      updateAt: '11 Apr')),
                ]),
              ),
              SizedBox(
                height: 50 + edge,
              ),
            ],
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: const Color(0xffF6F7F8),
            borderRadius: BorderRadius.circular(23)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          BottomNavbarItem(
            imageUrl: 'assets/Icon_home_solid.png',
            isActive: true,
          ),
          BottomNavbarItem(
            imageUrl: 'assets/Icon_mail_solid.png',
            isActive: false,
          ),
          BottomNavbarItem(
            imageUrl: 'assets/Icon_card_solid.png',
            isActive: false,
          ),
          BottomNavbarItem(
            imageUrl: 'assets/Icon_love_solid.png',
            isActive: false,
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
