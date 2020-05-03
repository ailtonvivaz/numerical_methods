import 'package:expressions/expressions.dart';

class Calculator {
  static calculate(String expression, Map<String, dynamic> context) {
    var exp = Expression.parse(expression);

    // Evaluate expression
    final evaluator = const ExpressionEvaluator();
    var r = evaluator.eval(exp, context);

    print(r); // = true
  }
}

enum CalculatorState { none, calculating, calculated }
