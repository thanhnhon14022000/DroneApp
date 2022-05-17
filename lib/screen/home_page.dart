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
    return BlocBuilder<CalculationBloc, CalculationState>(
        builder: (context, CalculationState state) {
      return Container(
        padding:
            EdgeInsets.only(top: size.height * 1 / 12, left: 12, right: 12),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'Caculator Flutter',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Light/Dark:', style: TextStyle(fontSize: 22)),
                  EasyDynamicThemeSwitch(),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                    //padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(
                        width: 5,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      )),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    
                    width: size.width,
                    height: 150,
                    child: Container(
                      //color: Colors.amber,
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 24, bottom: 24),
                      child: Text(_getDisplayText(state.calculationModel),
                          style: TextStyle( fontSize: 30)),
                    )),
                Container(
                  height: size.height * 1 / 2,
                  padding: EdgeInsets.all(10),
                  //color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _pressButton(text: '7', onPress: () => numberPressed(7)),
                          _pressButton(text: '8', onPress: () => numberPressed(8)),
                          _pressButton(text: '9', onPress: () => numberPressed(9)),
                          _pressButton(text: 'x', onPress: () => opentorPressed('*')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _pressButton(text: '4', onPress: () => numberPressed(4)),
                          _pressButton(text: '5', onPress: () => numberPressed(5)),
                          _pressButton(text: '6', onPress: () => numberPressed(6)),
                          _pressButton(text: '÷', onPress: () => opentorPressed('/')),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _pressButton(text: '1', onPress: () => numberPressed(1)),
                          _pressButton(text: '2', onPress: () => numberPressed(2)),
                          _pressButton(text: '3', onPress: () => numberPressed(3)),
                          _pressButton(text: '+', onPress: () => opentorPressed('+')),                        
                          ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _pressButton(text: '0',  onPress: () => numberPressed(0)),
                          _pressButton(text: 'Clear',  onPress: () => clearPressed()),
                          _pressButton(text: '=',  onPress: () => resultPressed()),
                          _pressButton(text: '-', onPress: () => opentorPressed('-')),
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
    });
  }

  Widget _pressButton({
    required String text,
    required VoidCallback onPress,
  }){
    return SizedBox(
       width: 80,
       height: 80,
       child:FloatingActionButton(
         onPressed: onPress,
         child: Text(text, style: TextStyle(fontSize: 20),),
       )
    );
  }

  void numberPressed(int number) {
    context.read<CalculationBloc>().add(NumberPressed(number: number));
  }

  void opentorPressed(String operator) {
    context.read<CalculationBloc>().add(OperatorPressed(operator: operator));
  }

  void resultPressed() {
    context.read<CalculationBloc>().add(CalculateResult());
  }

  void clearPressed() {
    context.read<CalculationBloc>().add(ClearCalculation());
  }

  String _getDisplayText(CalculationModel model) {
    if (model.result != null) {
      return '${model.result}';
    }

    if (model.secondOperand != null) {
      return '${model.firstOperand}${model.operator}${model.secondOperand}';
    }

    if (model.operator != null) {
      return '${model.firstOperand}${model.operator}';
    }

    if (model.firstOperand != null) {
      return '${model.firstOperand}';
    }

    return '${model.result ?? 0}';
  }
}
