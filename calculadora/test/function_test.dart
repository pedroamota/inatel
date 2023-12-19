import 'package:cicd/service/calculator_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Teste de soma', () {
    expect(CalculatorService.calc('5.0+3.0'), equals('8.0'));
  });

  test('Teste de subtração', () {
    expect(CalculatorService.calc('5.0-3.0'), equals('2.0'));
  });

  test('Teste de multiplicação', () {
    expect(CalculatorService.calc('5.0*3.0'), equals('15.0'));
  });

  test('Teste de divisão', () {
    expect(CalculatorService.calc('6.0/2.0'), equals('3.0'));
  });

  test('Teste de raiz quadrada', () {
    expect(CalculatorService.calc('16.0^(1/2)'), equals('4.0'));
  });

  test('Teste de potenciação', () {
    expect(CalculatorService.calc('3.0^2'), equals('9.0'));
  });

  test('Teste de porcentagem', () {
    expect(CalculatorService.calc('20%100'), equals('20.0'));
  });

  test('Funcoes', () {
    expect(CalculatorService.calc('10.0 + ( 13 - 3 ) * 2'), equals('30.0'));
  });

test('Erro: Variaveis invalidas', () {
  expect(CalculatorService.calc('b * a'),equals('Invalid values'));
});

  test('Erro: Funcoes invalidas', () {
    expect(CalculatorService.calc('a + ( 13 - 3 ) * 2'), equals('Invalid values'));
  });

}
