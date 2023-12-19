import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';
import 'package:yourjob/helpers/crub.dart';
import 'package:yourjob/model/worker.dart';
import 'package:yourjob/view/pages/add_work.dart';
import 'package:yourjob/view/pages/.dart';
home_page
void main() {
  group('Teste do backend', () {
    test('Verificar resposta do banco de dados', () async {
      final result = await Crud().getAllData();

      expect("List<Worker>", result.runtimeType.toString());
    });

    test('Insert New Service', () async {
      String cat = "Saúde";

      Worker aux = Worker(
        name: 'Teste_$cat',
        category: cat,
        stars: 5,
        phone: '35999693123',
      );

      final result = await Crud().insertWorker(aux);

      expect(202, result);
    });
  });

  testWidgets('Exemplo de teste de widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Olá, mundo!'),
        ),
      ),
    ));

    expect(find.text('Olá, mundo!'), findsOneWidget);
  });

  testWidgets('Teste de Widget AddWork', (WidgetTester tester) async {
    await tester.pumpWidget(
      Sizer(
        builder: (context, orientation, deviceType) {
          return const MaterialApp(home: AddWork());
        },
      ),
    );

    await tester.enterText(find.byType(TextFormField).at(0), 'Nome da Empresa');
    await tester.enterText(
        find.byType(TextFormField).at(1), 'Numero da Empresa');

    await tester.tap(find.byType(DropdownButtonFormField).last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Jardim').last);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(MyHomePage), findsOneWidget);
  });
}
