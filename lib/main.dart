import 'package:drone/bloc_caculator/bloc_class.dart';
import 'package:drone/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'themes.dart';
import 'screen/leading_page.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(EasyDynamicThemeWidget( 
        child: MyApp())),
    blocObserver: AppBlocObserver(),
  );
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controler Drone',
      theme:  lightThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: Scaffold(
        body: BlocProvider<CalculationBloc>(create: (context)=>CalculationBloc(),
        child: LeadingPage(),
        ),

      ),
    );
  }
}
