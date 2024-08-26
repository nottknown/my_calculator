import 'package:flutter/material.dart';

import 'button.dart';

class CalPage extends StatefulWidget {
  const CalPage({super.key});

  @override
  State<CalPage> createState() => _CalPageState();
}

class _CalPageState extends State<CalPage> {

  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '9', '8', '7', 'x',
    '6', '5', '4', '-',
    '3', '2', '1', '+',
    '0', '.', 'ANS', '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        userQuestion,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        userAnswer,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),

          Expanded(
            flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index){
                    if(index == 0) {
                      return Button(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = '';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.white,
                      );
                    } else if(index == 1) {
                      return Button(
                        buttonTapped: () {
                          userQuestion = userQuestion.substring(0, userQuestion.length-1);
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    } else if(index == buttons.length-1) {
                      return Button(
                        buttonTapped: () {
                          setState(() {
                            equalPassed();
                          });
                        },
                        buttonText: buttons[index],
                        textColor: Colors.white,
                        color: Colors.deepPurple,
                      );
                    } else {
                      return Button(
                        buttonTapped: () {
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.white,
                        textColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple[500],
                      );
                    }
                    }
              ),
          ),
          ),
        ],
      )
    );
  }
}


bool isOperator(String x) {
  if(x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
    return true;
  }
  return false;
}

void equalPassed () {
  String finalAnswer =
}