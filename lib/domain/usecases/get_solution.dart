import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:i_like_a_math/core/error/failure.dart';
import 'package:i_like_a_math/core/usecases/usecase.dart';
import 'package:i_like_a_math/domain/entities/solution_entity.dart';
import 'package:i_like_a_math/domain/repositories/solution_repository.dart';

class GetSolution extends UseCase<SolutionEntity, SolutionParams>{
  final SolutionRepository solutionRepository;

  GetSolution(this.solutionRepository);

  /*
    Был метод getSolutionBy. Переименовали его в call.
    Call-метод позволяет обращаться к нему упрощенно, типа object(1, 123) вместо object.call(1, 123)
   */
  @override
  Future<Either<Failure, SolutionEntity>> call(SolutionParams params) async {
    return await solutionRepository.getSolution(params.digit, params.number);
  }
}

class SolutionParams extends Equatable {
  final int digit;
  final int number;

  const SolutionParams({required this.digit, required this.number});

  @override
  List<Object?> get props => [digit, number];
}