import 'package:dartz/dartz.dart';
import 'package:ml_project/features/number_trivia/data/repositories/number_trivia_local_data_source.dart';
import 'package:ml_project/features/number_trivia/data/repositories/number_trivia_remote_data_source.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/repositories/number_trivia_repository.dart';
import '../models/number_trivia_model.dart';

typedef ConcreteOrRandomChooser = Future<NumberTrivia> Function();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  NumberTriviaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  @override
  Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(
    final int number,
  ) async =>
      _getTrivia(() => remoteDataSource.getConcreteNumberTrivia(number));

  @override
  Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia() async =>
      _getTrivia(remoteDataSource.getRandomNumberTrivia);

  Future<Either<Failure, NumberTrivia>> _getTrivia(
    final ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final NumberTrivia remoteTrivia = await getConcreteOrRandom();
        await localDataSource
            .cacheNumberTrivia(remoteTrivia as NumberTriviaModel);
        return Right<Failure, NumberTrivia>(remoteTrivia);
      } on ServerException {
        return Left<Failure, NumberTrivia>(ServerFailure());
      }
    } else {
      try {
        final NumberTriviaModel localTrivia =
            await localDataSource.getLastNumberTrivia();
        return Right<Failure, NumberTrivia>(localTrivia);
      } on CacheException {
        return Left<Failure, NumberTrivia>(CacheFailure());
      }
    }
  }
}
