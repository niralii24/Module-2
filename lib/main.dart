import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MaterialApp(
  home: Calculator(),
  debugShowCheckedModeBanner: false,
));

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String display = "0";
  String ans = "0";
  String exp = "";
  double displayFontSize = 40.0;
  double ansFontSize = 30.0;

  buttonPressed(String buttonText) {
    setState(() {
      if(buttonText == "C") {
        displayFontSize = 30.0;
        ansFontSize = 40.0;

        display = "0";
        ans = "0";
      }
      else if(buttonText == "⌫") {
        displayFontSize = 40.0;
        ansFontSize = 30.0;

        display = display.substring(0, display.length - 1);
        if(display == "") {
          display = "0";
        }
      }
      else if(buttonText == "=") {
        displayFontSize = 30.0;
        ansFontSize = 40.0;

        exp = display;
        try {
          Parser p = new Parser();
          Expression x = p.parse(exp);
          ContextModel cm = ContextModel();
          ans = '${x.evaluate(EvaluationType.REAL, cm).toString()}';
        }
        catch(e) {
          ans = "Error";
        }
      }
      else {
        displayFontSize = 40.0;
        ansFontSize = 30.0;
        if(display == "0") {
          display = buttonText;
        }
        else {
          display += buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          side: BorderSide(width: 1),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("My Calc"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),

      body: Column(
        children: [
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
              color: Colors.grey[300],
              child: Text(
                display,
                style: TextStyle(
                  fontSize: displayFontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              )
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            color: Colors.grey[300],
            child: Text(
              ans,
              style: TextStyle(
                fontSize: ansFontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),

          Expanded(
            child: Divider(),
          ),

          Row(
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.blueGrey),
                        buildButton("⌫", 1, Colors.amber),
                        buildButton("/", 1, Colors.amber),
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.grey),
                        buildButton("8", 1, Colors.grey),
                        buildButton("9", 1, Colors.grey),
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton("4", 1, Colors.grey),
                        buildButton("5", 1, Colors.grey),
                        buildButton("6", 1, Colors.grey),
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton("1", 1, Colors.grey),
                        buildButton("2", 1, Colors.grey),
                        buildButton("3", 1, Colors.grey),
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton(".", 1, Colors.grey),
                        buildButton("0", 1, Colors.grey),
                        buildButton("00", 1, Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("*", 1, Colors.amber),
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton("-", 1, Colors.amber),
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton("+", 1, Colors.amber),
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton("=", 2, Colors.blueGrey),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}