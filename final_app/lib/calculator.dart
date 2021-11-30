
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'model.dart';
import 'service.dart';





class CalculatorPage extends StatefulWidget {
  CalculatorPage ({Key? key}) : super(key: key);



  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  // List<History> historys = List.empty();

  @override
  void initState() {
    num1 = 0.0;
    num2 = 0.0;
    result =''; // output 2
    output ='0'; // output 1
    history = '';
    operation = '';
    super.initState();
  }





double num1 = 0.0;
double num2 = 0.0;
String result =''; // output 2
String output ='0'; // output 1
String history = '';
String operation = '';

buttonPressed(String buttonText) async {
var services = HistoryServices();
var controller = HistoryController(services);
  

  if(buttonText == 'C') {
    result = '0';
    num1 = 0;
    num2 = 0;
    history = '';
   
  } else if(buttonText == 'CE') {
    result = '0';
    num1 = 0;
    num2 = 0;

  } else if (buttonText == '+/-') {
    if (result[0] != '-' ) {
      result = '-' + result.substring(1);
    }
  } else if(buttonText == '⌫') {
    result = output.substring(0, output.length - 1);
      

  } else if (buttonText == '+' ||
      buttonText =='-' ||
      buttonText == 'x' ||
      buttonText == '÷') {
     
    num1 = double.parse(output);
    operation = buttonText;
    result = '0';

  } else if (buttonText == '+') {
  } else if (buttonText == '-') {
  } else if (buttonText == 'x') {
  } else if (buttonText == '÷') {
   
   result = result + buttonText;
  
  } else if (buttonText == '.') {
    if (result.toString().contains('.')) {
      print('allready have decimals');
    return;
    } else {
      result = result + buttonText;
    }
  
  } else if (buttonText == '=') {
     num2 = double.parse(output);
     if(operation == '+') {
      result = (num1 + num2).toString();
        context.read<AllHistorys>().result = result;
      history = num1.toString() + operation.toString() + num2.toString();
        context.read<AllHistorys>().history = result;
       
     }
     if(operation == '-') {
      result = (num1 - num2).toString();
        context.read<AllHistorys>().result = result;
      history = num1.toString() + operation.toString() + num2.toString();
        context.read<AllHistorys>().history = history;
    }
    if(operation == 'x') {
      result = (num1 * num2).toString();
        context.read<AllHistorys>().result = result;
      history = num1.toString() + operation.toString() + num2.toString();
        context.read<AllHistorys>().history = history;
    
    }
    if(operation == '÷') {
      result = (num1 / num2).toString();
        context.read<AllHistorys>().result = result;
      history = num1.toString() + operation.toString() + num2.toString();
        context.read<AllHistorys>().history = history;
      
    }
    num1 = 0;
    num2 = 0;
    operation = '';
  
    } else {
       result = result + buttonText;
    }
    

      if (buttonText == "=") {
        await FirebaseFirestore.instance.collection('result_history').doc().set({'History':history, 'result':result,"pressedTime":Timestamp.now()});
      }
    
    print(output);
    setState(() {
    output = double.parse(result).toString();
  });
}

 

  Widget calculatorButton(String buttonText) {

  return Expanded(
    child: SizedBox(
      height: 80,
      width: 80,
      child: TextButton(
        style: TextButton.styleFrom(
          side: BorderSide(color: Colors.grey, width: 0.5),
          backgroundColor: Colors.blueGrey[900]
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
        
        
      ),
      
    ),
  );
 }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 12),
              child: Text(history,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.grey
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(12),
              child: Text(output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            // Expanded(
            //   child: Divider()
            // ),
           Column(
              children: [
                Row(
                  children: [
                    calculatorButton('CE'),
                    calculatorButton('C'),
                    calculatorButton('⌫'),
                    calculatorButton('÷')
                  ],
                ),
                Row(
                  children: [
                    calculatorButton('7'),
                    calculatorButton('8'),
                    calculatorButton('9'),
                    calculatorButton('x')
                  ],
                ),
                Row(
                  children: [
                    calculatorButton('4'),
                    calculatorButton('5'),
                    calculatorButton('6'),
                    calculatorButton('-')
                  ],
                ),
                Row(
                  children: [
                    calculatorButton('1'),
                    calculatorButton('2'),
                    calculatorButton('3'),
                    calculatorButton('+')
                  ],
                ),
                Row(
                  children: [
                    calculatorButton('+/-'),
                    calculatorButton('0'),
                    calculatorButton('.'),
                    calculatorButton('=',)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
