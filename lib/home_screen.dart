import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.orangeAccent.withOpacity(.7),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        userInput.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          answer.toString(),
                          style:
                              const TextStyle(fontSize: 30, color: Colors.white),
                        ),
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
                        MyBtn(
                          title: 'AC',
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '+/-',
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '%',
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '/',
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyBtn(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: 'X',
                          onPress: () {
                            userInput += 'X';
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyBtn(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '-',
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyBtn(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '+',
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyBtn(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: 'DEL',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyBtn(
                          title: '=',
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void equalPress() {
    String finalUSerInput = userInput;
    finalUSerInput = userInput.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUSerInput);
    ContextModel contextModel = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
