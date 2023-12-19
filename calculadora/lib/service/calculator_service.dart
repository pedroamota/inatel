import 'package:math_expressions/math_expressions.dart';

class CalculatorService{
  static calc(String userInput){
    try{
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    return eval.toString();
    }catch(e){
      return 'Invalid values';
    }

  } 
}