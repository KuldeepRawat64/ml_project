import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ml_project/core/error/failures.dart';
import 'package:ml_project/core/use_case.dart';
import 'package:ml_project/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:ml_project/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:ml_project/features/number_trivia/domain/use_cases/get_concrete_number_trivia.dart';
import 'package:ml_project/features/number_trivia/domain/use_cases/get_random_number_trivia.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// class MockNumberTriviaRepository extends Mock
//     implements NumberTriviaRepository {}

@GenerateNiceMocks([MockSpec<NumberTriviaRepository>()])
import 'get_random_number_trivia_test.mocks.dart';

void main() {
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late GetRandomNumberTrivia usecase;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final int tNumber = 1;
  final NumberTrivia tNumberTrivia =
      NumberTrivia(text: 'test', number: tNumber);

  test(
    'should get random trivia for the number from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mockNumberTriviaRepository.getRandomNumberTrivia()).thenAnswer(
        (final _) async => Right<Failure, NumberTrivia>(tNumberTrivia),
      );
      // The "act" phase of the test. Call the not-yet-existent method.
      final Either<Failure, NumberTrivia>? result = await usecase(NoParams());
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right<Failure, NumberTrivia>(tNumberTrivia));
      // Verify that the method has been called on the Repository
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
