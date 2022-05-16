import 'package:flutter/material.dart';
import '/value/app_fonts.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drone/bloc_caculator/bloc_import.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider<CalculationBloc>(
      create: (context) => CalculationBloc(),
        child: BlocBuilder<CalculationBloc, CalculationState>(
            builder: (context, CalculationState state) {
          return Container(
            child: Padding(
              padding:
                EdgeInsets.only(top: size.height * 1 / 12),
              child: Column(
                children: [
                  Container(
                    //color: Colors.red,
                    alignment: Alignment.center,
                    child:
                        Text(
                          'Caculator Flutter',
                          style: AppStyles.h2.copyWith(fontSize: 40,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Light/Dark:', style: AppStyles.h3),
                      EasyDynamicThemeSwitch(),
                    ],),
                  ),
                ],
              ),
        ),
          );
        }),
    ));
  }

  void numberPressed(int number) {
    context.read<CalculationBloc>().add(NumberPressed(number: number));
  }
}









//EasyDynamicThemeBtn(),

// Scaffold(
//       body: Container(
//         child: Padding(
//           padding:
//               EdgeInsets.only(top: size.height * 1 / 12),
//           child: Column(
//             children: [
//               Container(
//                 //color: Colors.red,
//                 alignment: Alignment.center,
//                 child:
//                     Text(
//                       'Caculator Flutter',
//                       style: AppStyles.h2.copyWith(fontSize: 40,fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                   Text('Light/Dark:', style: AppStyles.h3),
//                   EasyDynamicThemeSwitch(),
//                 ],),
//               ),
//             ],
//           ),
//         ),
//         //decoration: BoxDecoration,
//         //color: Colors.black, //thay doi mau sat o day
        
//       ),
//     );