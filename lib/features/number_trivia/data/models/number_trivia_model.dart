import 'package:ml_project/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({
    required final String text,
    required final int number,
  }) : super(
          text: text,
          number: number,
        );

  factory NumberTriviaModel.fromJson(final Map<String, dynamic> json) =>
      NumberTriviaModel(
        text: json['text'],
        // The 'num' type can be both a 'double' and an 'int'
        number: (json['number'] as num).toInt(),
      );
  Map<String, dynamic> toJson() => {
        'text': text,
        'number': number,
      };
}
