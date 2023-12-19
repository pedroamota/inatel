import 'package:cicd/service/calculator_service.dart';
import 'package:flutter/material.dart';
import '../components/button_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      userInput.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    answer.toString(),
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    MyButton(
                      title: 'AC',
                      onPress: () {
                        userInput = '';
                        answer = '';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '%',
                      onPress: () {
                        userInput += '%';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '^',
                      onPress: () {
                        userInput += '!';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '÷',
                      color: Colors.green,
                      onPress: () {
                        userInput += '/';
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '7',
                      onPress: () {
                        userInput += '7';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '8',
                      onPress: () {
                        userInput += '8';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '9',
                      onPress: () {
                        userInput += '9';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: 'x',
                      color: Colors.green,
                      onPress: () {
                        userInput += '*';
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '4',
                      onPress: () {
                        userInput += '4';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '5',
                      onPress: () {
                        userInput += '5';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '6',
                      onPress: () {
                        userInput += '6';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '-',
                      color: Colors.green,
                      onPress: () {
                        userInput += '-';
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '1',
                      onPress: () {
                        userInput += '1';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '2',
                      onPress: () {
                        userInput += '2';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '3',
                      onPress: () {
                        userInput += '3';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '+',
                      color: Colors.green,
                      onPress: () {
                        userInput += '+';
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '0',
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '.',
                      onPress: () {
                        userInput += '.';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: 'DEL',
                      onPress: () {
                        userInput =
                            userInput.substring(0, userInput.length - 1);
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '=',
                      color: Colors.green,
                      onPress: () {
                        answer = CalculatorService.calc(userInput);
                        setState(() {});
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
