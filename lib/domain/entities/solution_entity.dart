import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

class SolutionEntity extends Equatable {
  late final int digit;
  late final int number;
  late final List<ExpressionElem> solutionElems;

  SolutionEntity({required this.digit, required this.number, required this.solutionElems});

  SolutionEntity.empty() {
    digit = 0;
    number = 123;
    solutionElems = [ExpressionElem(1, "noSolution".tr())];
  }

  SolutionEntity.error({required this.digit, required this.number, required errorMsg}) {
    solutionElems = [ExpressionElem(1, errorMsg)];
  }

  @override
  List<Object?> get props => [digit, number];
}

class ExpressionElem {
  final int level;
  final String expression;

  ExpressionElem(this.level, this.expression);

  @override
  String toString() {
    return "[$level, $expression]";
  }
}