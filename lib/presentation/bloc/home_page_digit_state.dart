import 'package:equatable/equatable.dart';
import 'package:i_like_a_math/domain/entities/solution_entity.dart';

class DigitAndNumberState extends Equatable {
  final SolutionEntity solutionEntity;

  late final int numD1; // 100x
  late final int numD2; // 10x
  late final int numD3; // 1x

  DigitAndNumberState({
    required this.solutionEntity,
  }) {
    int number = solutionEntity.number;
    numD1 = number ~/ 100;
    numD2 = (number ~/ 10) %10;
    numD3 = number % 10;
  }

  int getNumberDigit(int digitOrder) {
    switch(digitOrder) {
      case 1: return numD1;
      case 2: return numD2;
      case 3: return numD3;
    }
    throw Exception("A digit order [$digitOrder] of number is out of range.");
  }

  int getNumberWhenChangeDigitInNumber(int digit, int digitOrder) {
    assert(digitOrder >= 1 && digitOrder <= 3, "A digit order [$digitOrder] of number is out of range.");
    assert(digit >= 0 && digit <= 9, "A digit [$digit] of is out of range.");
    var num1 = numD1;
    var num2 = numD2;
    var num3 = numD3;

    switch(digitOrder) {
      case 1: num1 = digit; break;
      case 2: num2 = digit; break;
      case 3: num3 = digit; break;
    }
    return num1*100 + num2*10 + num3;
  }

  @override
  List<Object?> get props => [solutionEntity.digit, solutionEntity.number];
}