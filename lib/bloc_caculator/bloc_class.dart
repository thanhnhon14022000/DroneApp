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
    if (event is NumberPressed) {
      yield await _mapNumberPressedToState(event);
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
        print('Dang la cong');
        result = model.firstOperand! + model.secondOperand!;
        break;
      case '-':
        print('Dang la tru');
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

    final CalculationModel newModel =
        CalculationInitial().calculationModel.copyWith(
              firstOperand: result,
            );
    return CalculationChanged(
      calculationModel: newModel,
    );
  }

  
  // Stream<CalculationState> _mapCalculateResultToState(
  //   CalculateResult event,
  // ) async* {
  //   final CalculationModel model = state.calculationModel;

  //   if (model.operator == null || model.secondOperand == null) {
  //     yield state;
  //     return;
  //   }

  //   int result = 0;

  //   switch (model.operator) {
  //     case '+':
  //       result = model.firstOperand! + model.secondOperand!;
  //       break;
  //     case '-':
  //       result = model.firstOperand! - model.secondOperand!;
  //       break;
  //     case '*':
  //       result = model.firstOperand! * model.secondOperand!;
  //       break;
  //     case '/':
  //       if (model.secondOperand == 0) {
  //         result = 0;
  //       } else {
  //         result = model.firstOperand! ~/ model.secondOperand!;
  //       }
  //       break;
  //   }
  //   final CalculationModel newModel =
  //       CalculationInitial().calculationModel.copyWith(
  //             firstOperand: result,
  //           );
  //   yield CalculationChanged(
  //       calculationModel: newModel,
  //     );
  // }

  Future<CalculationState> _mapNumberPressedToState(
    NumberPressed event,
  ) async {
    final CalculationModel model = state.calculationModel;

    if (model.result != null) {
      final CalculationModel newModel = model.copyWith(
        firstOperand: event.number,
      );

      return CalculationChanged(
        calculationModel: newModel,
      );
    }

    if (model.firstOperand == null) {
      final CalculationModel newModel =
          model.copyWith(firstOperand: event.number);

      return CalculationChanged(
        calculationModel: newModel,
      );
    }

    if (model.operator == null) {
      final CalculationModel newModel = model.copyWith(
        firstOperand: int.parse('${model.firstOperand}${event.number}'),
      );

      return CalculationChanged(
        calculationModel: newModel,
      );
    }

    if (model.secondOperand == null) {
      final CalculationModel newModel =
          model.copyWith(secondOperand: event.number);

      return CalculationChanged(
        calculationModel: newModel,
      );
    }

    return CalculationChanged(
      calculationModel: model.copyWith(
        secondOperand: int.parse('${model.secondOperand}${event.number}'),
      ),
    );
  }
}
