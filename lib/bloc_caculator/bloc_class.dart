//import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'class_event.dart';
import 'class_state.dart';

class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
  CalculationBloc() : super(CalculationInitial());

  @override
  Stream<CalculationState> mapEventToState(
    CalculationEvent event,
  ) async* {
    if (event is OperatorPressed) {
      yield await _mapOperatorPressedToState(event);
    }

    if (event is OperatorPressed) {
      yield await _mapOperatorPressedToState(event);
    }

    if (event is ClearCalculation) {
      yield CalculationInitial();
    }

    if (event is CalculateResult) {
      yield await _mapCalculateResultToState(event);
    }
  }

  // Future<CalculationState>

  Future<CalculationState> _mapOperatorPressedToState(
    OperatorPressed event,
  ) async {
    List<String> allowedOperators = ['+', '-', '*', '/'];

    if (!allowedOperators.contains(event.operator)) {
      return state;
    }

    CalculationModel model = state.calculationModel;

    return CalculationChanged(
        calculationModel: CalculationModel(
            firstOperand: model.firstOperand,
            operator: event.operator,
            secondOperand: model.secondOperand,
            result: model.result));
  }

  Future<CalculationState> _mapCalculateResultToState(
    CalculateResult event,
  ) async {
    CalculationModel model = state.calculationModel;
    if (model.operator == null || model.secondOperand == null) {
      return state;
    }
    int result = 0;

    switch (model.operator) {
      case '+':
        result = model.firstOperand! + model.secondOperand!;
        break;
      case '-':
        result = model.firstOperand! - model.secondOperand!;
        break;
      case '*':
        result = model.firstOperand! * model.secondOperand!;
        break;
      case '/':
        if (model.secondOperand == 0) {
          result = 0;
        } else {
          result = 0;
        }
        break;
    }
    // TODO: implement _mapCaculateResultToState
    throw UnimplementedError();
  }

  Future<CalculationState> _mapNumberPressedToState(
    NumberPressed event,
  ) async {
    CalculationModel model = state.calculationModel;
    throw UnimplementedError();
  }
}
