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
          padding: EdgeInsets.only(top: size.height * 1 / 12, left: 12, right: 12),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Caculator Flutter',
                  style: AppStyles.h2
                      .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Light/Dark:', style: AppStyles.h3),
                    EasyDynamicThemeSwitch(),
                  ],
                ),
              ),

              Column(
                
                children: [

                  Container(
                    width: size.width,
                    height: 150,
                    color: Colors.red,
                    child: Container(
                      color: Colors.amber,
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 24, bottom: 24),
                      child: Text('150x150', style: TextStyle(color: Colors.black, fontSize: 30)),
                    )
                  ),

                  Container(
                    height: size.height*1/2,
                    padding: EdgeInsets.all(10),
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              child: Text('7'),
                              onPressed:(){
                                numberPressed(7);

                              }),

                            FloatingActionButton(
                              child: Text('8'),
                              onPressed:(){
                                numberPressed(8);
                              }),
                            FloatingActionButton(
                              child: Text('9'),
                              onPressed:(){
                                numberPressed(9);
                              }),
                            FloatingActionButton(
                              backgroundColor: Colors.red,
                              child: Text('x'),
                              onPressed:(){
                                opentorPressed('x');
                              }),
                            
                          ],
                    ),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          child: Text('4'),
                          onPressed:(){
                            numberPressed(4);
                          }),

                        FloatingActionButton(
                          child: Text('5'),
                          onPressed:(){
                            numberPressed(5);
                          }),
                        FloatingActionButton(
                          child: Text('6'),
                          onPressed:(){
                            numberPressed(6);
                          }),
                        FloatingActionButton(
                          backgroundColor: Colors.red,
                          child: Text('-'),
                          onPressed:(){
                              opentorPressed('-');
                          }),
                        
                      ],
                    ),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       
                        FloatingActionButton(
                          child: Text('1'),
                           onPressed:(){
                             numberPressed(7);
                           }),
                        FloatingActionButton(
                          child: Text('2'),
                          onPressed:(){
                            numberPressed(7);
                          }),
                        FloatingActionButton(
                          child: Text('3'),
                          onPressed:(){
                            
                          }),
                        FloatingActionButton(
                          backgroundColor: Colors.red,
                          child: Text('+'),
                          onPressed:(){
                              opentorPressed('+');
                          }),
                        
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          child: Text('0'),
                          onPressed:(){
                             numberPressed(7);
                          }),

                        FloatingActionButton(
                          child: Text('Clear'),
                          onPressed:(){
                            clearPressed();
                          }),

                        FloatingActionButton(
                          child: Text('='),
                          onPressed:(){
                            resultPressed();
                          }),

                        FloatingActionButton(
                          backgroundColor: Colors.red,
                          child: Text('/'),
                          onPressed:(){
                              opentorPressed('/');
                          }),
                      ],
                    )
                      ],
                      
                    ),
                  ),
                 
                ],
              )


            ],
          ),
        );
      }),
    ));
  }
  

  void numberPressed(int number) {
    context.read<CalculationBloc>().add(NumberPressed(number: number));
  }

  void opentorPressed(String operator){
    context.read<CalculationBloc>().add(OperatorPressed(operator: operator));
  }

  void resultPressed(){
    context.read<CalculationBloc>().add(CalculateResult());
  }

  void clearPressed(){
    context.read<CalculationBloc>().add(ClearCalculation());
  }

}
