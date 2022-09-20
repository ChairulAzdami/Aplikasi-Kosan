import 'package:flutter/material.dart';
import 'package:project_cozy/pages/home_page.dart';
import 'package:project_cozy/theme.dart';

class ErrorPage extends StatelessWidget {
  // const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/error.png',
                width: 300,
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                'Where are you going?',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                  'Seems like the page that you were\nrequested is already gone',
                  style: greyTextStyle.copyWith(fontSize: 16),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 210,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false);
                  },
                  color: purpleColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  child: Text(
                    'Back to Home',
                    style: blackTextStyle.copyWith(
                        fontSize: 18, color: whiteColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
