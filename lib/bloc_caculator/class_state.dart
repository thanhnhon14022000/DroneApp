import 'package:equatable/equatable.dart';

class CalculationModel extends Equatable {
  CalculationModel({
    this.firstOperand,
    this.operator,
    this.secondOperand,
    this.result,
  });

  final int? firstOperand;
  final String? operator;
  final int? secondOperand;
  final int? result;
  
  @override
  String toString() {
    return "$firstOperand$operator$secondOperand=$result";
  }

  @override
  List<Object?> get props => [firstOperand, operator, secondOperand, result];
  
}


class CalculationState extends Equatable {
  final CalculationModel calculationModel;

  const CalculationState({required this.calculationModel});

  @override
  List<Object> get props => [calculationModel];
}

class CalculationInitial extends CalculationState {
  CalculationInitial() : super(calculationModel: CalculationModel());
}

class CalculationChanged extends CalculationState {
  final CalculationModel calculationModel;

  const CalculationChanged({required this.calculationModel})
      : super(calculationModel: calculationModel);

  @override
  List<Object> get props => [calculationModel];
}