import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_cozy/pages/error_page.dart';
import 'package:project_cozy/theme.dart';
import 'package:project_cozy/widgets/faciliti_item.dart';
import 'package:project_cozy/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/space.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({Key? key}) : super(key: key);

  final Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isCliked = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Konfirmasi'),
              content: SingleChildScrollView(
                  child: ListBody(
                children: const <Widget>[
                  Text('Apakah anda ingin menghubungi pemiliki kos?'),
                ],
              )),
              actions: <Widget>[
                TextButton(
                  child: const Text('Batal'),
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                ),
                TextButton(
                  child: const Text('Hubungi'),
                  onPressed: () {
                    launchUrl('tel:${widget.space.phone}');
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                widget.space.imageUrl ?? '',
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  const SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        color: whiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),

                        // NOTE : TITLE
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.space.name ?? '',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(TextSpan(
                                      text: '\$${widget.space.price}',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: '/ month',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16))
                                      ])),
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: RatingItem(
                                      index: index,
                                      rating: widget.space.rating,
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // NOTE : MAIN FACILITIES
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text("Main Facilities",
                              style: regulerTextStyle.copyWith(fontSize: 16)),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                name: ' kitchen',
                                total: widget.space.numberOfKitchens,
                                imageUrl: 'assets/icon_kitchen.png',
                              ),
                              FacilityItem(
                                name: ' bedroom',
                                total: widget.space.numberOfBedrooms,
                                imageUrl: 'assets/icon_bedroom.png',
                              ),
                              FacilityItem(
                                name: ' Big lemari',
                                total: widget.space.numberOfCupboards,
                                imageUrl: 'assets/icon_cupboard.png',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // NOTE : PHOTO
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text("Photos",
                              style: regulerTextStyle.copyWith(fontSize: 16)),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.space.photos!.map((item) {
                              return Container(
                                margin: EdgeInsets.only(left: 24),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // NOTE : LOCATION
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text("Location",
                              style: regulerTextStyle.copyWith(fontSize: 16)),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.space.address}\n${widget.space.city}',
                                style: greyTextStyle,
                              ),
                              InkWell(
                                onTap: () {
                                  launchUrl(
                                      // 'https://www.google.com/maps/@4.158429,96.1109643,13z'
                                      widget.space.mapUrl ?? '');
                                },
                                child: Image.asset(
                                  'assets/btn_location.png',
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: edge),
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: RaisedButton(
                            onPressed: (() {
                              showConfirmation();
                            }),
                            color: purpleColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_back.png',
                        width: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isCliked = !isCliked;
                        });
                      },
                      child: Image.asset(
                        isCliked
                            ? 'assets/btn_wishlist_failed.png'
                            : 'assets/btn_wishlist.png',
                        width: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
