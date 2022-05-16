import 'package:drone/bloc_caculator/bloc_class.dart';
import 'package:drone/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

import 'screen/leading_page.dart';

void main() {
  runApp(EasyDynamicThemeWidget( 
        child: MyApp(), 
    ), );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controler Drone',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: Scaffold(
        body: BlocProvider<CalculationBloc>(create: (context)=>CalculationBloc(),
        child: HomePage(),
        ),

      ),
    );
  }
}
