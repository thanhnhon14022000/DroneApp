import 'package:drone/value/app_picture.dart';
import 'package:flutter/material.dart';

import '../value/app_fonts.dart';

class LeadingPage extends StatelessWidget {
  const LeadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(Picture.backGround),
            fit: BoxFit.fill,
          )),
          child: Padding(
            padding:
                EdgeInsets.only(top: size.height * 1 / 12, left: 10, right: 10,bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcom to',
                  style: AppStyles.h1.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.topRight,
                      child: Text(
                        'Real-time Robotics',
                        style: AppStyles.h2,
                      )),
                Container(
                  //color: Colors.red,
                  padding: EdgeInsets.only(top: size.height*1/10),
                  child: Image.asset(Picture.hinhDrone),
                ),
                Container(
                  //color: Colors.amber,
                  margin:
                      EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 30),
                  child: Image.asset(Picture.logoRealTeam),
                ),
                Spacer(),
                Text('Orbital flight control application for drone ',
                    style: AppStyles.h3),
                              
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                      width: 229.0,
                      height: 65.0,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.white,
                        child: Text(
                          'Get Started',
                          style: AppStyles.h3.copyWith(color: Colors.black),
                        ),
                        onPressed: () {
                          // ignore: avoid_print
                          print("$size");
                        },
                      )),
                ),
              Spacer(),
              Container(
                alignment: Alignment. bottomCenter,
                child: Text('Version 1.01'),
              )
              
              ],
            ),
          )),
    );
  }
}
