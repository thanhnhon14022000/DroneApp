import 'package:flutter/material.dart';
import '/themes.dart';
import '/value/app_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool _light = true;

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.amber);

ThemeData _darkTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.dark,
    primaryColor: Colors.amber);

class _HomePageState extends State<HomePage> {

  @override


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    theme: _light ? _lightTheme : _darkTheme;
    return Scaffold(
      body: Container(
        
        //decoration: BoxDecoration,
        //color: Colors.black, //thay doi mau sat o day
        child: Padding(
          padding:
              EdgeInsets.only(top: size.height * 1 / 12, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Caculator Flutter',
                  style: AppStyles.h2.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Switch(
                  value: _light,
                  onChanged: (state) {
                  setState(() {
                    print(state);
                    _light = state;
            });
          },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
