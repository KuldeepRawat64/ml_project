import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ml_project/core/use_case.dart';

import '../../../../core/error/failures.dart';
import 'package:ml_project/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:ml_project/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia extends UseCase<NumberTrivia, Params> {
  GetConcreteNumberTrivia(this.repository);
  final NumberTriviaRepository repository;

  Future<Either<Failure, NumberTrivia>> execute({
    required final int number,
  }) async =>
      repository.getConcreteNumberTrivia(number);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async =>
      repository.getConcreteNumberTrivia(params.number);
}

class Params extends Equatable {
  const Params({required this.number});
  final int number;

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}
