import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;

  //Button Widget
  Widget calcbutton(String buttontext, Color buttoncolor, Color textcolor) {
    return Container(
      child: Container(
        height: 80,
        width: 80,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: buttoncolor,
              onPrimary: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(360)))),
          onPressed: () {
            calculation(buttontext);
          },
          child: Text(
            '$buttontext',
            style: TextStyle(
              fontSize: 35,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('AC', Colors.purple.shade100, Colors.black),
                calcbutton('+/-', Colors.purple.shade100, Colors.black),
                calcbutton('%', Colors.purple.shade100, Colors.black),
                calcbutton('/', Colors.pink.shade300, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.purple.shade300, Colors.white),
                calcbutton('8', Colors.purple.shade300, Colors.white),
                calcbutton('9', Colors.purple.shade300, Colors.white),
                calcbutton('x', Colors.pink.shade300, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.purple.shade300, Colors.white),
                calcbutton('5', Colors.purple.shade300, Colors.white),
                calcbutton('6', Colors.purple.shade300, Colors.white),
                calcbutton('-', Colors.pink.shade300, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.purple.shade300, Colors.white),
                calcbutton('2', Colors.purple.shade300, Colors.white),
                calcbutton('3', Colors.purple.shade300, Colors.white),
                calcbutton('+', Colors.pink.shade300, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //button Zero
                Container(
                  width: 180,
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple.shade300,
                        onPrimary: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(180)))),
                    onPressed: () {
                      calculation('0');
                    },
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ),
                calcbutton('.', Colors.purple.shade300, Colors.white),
                calcbutton('=', Colors.pink.shade300, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  //Calculator number
  dynamic text = '0';
  double number1 = 0; //ให้number1มีค่าเท่ากับ0
  double number2 = 0; //ให้number2มีค่าเท่ากับ0

  dynamic result = '';
  dynamic finalResult = '';
  dynamic operation = '';
  dynamic preOperation = '';
  //ส่งค่าที่รับมาจากปุ่มที่เรากด
  void calculation(buttonText) {
    //ถ้าเรากดที่ปุ่มAC
    if (buttonText == 'AC') {
      text = '0';
      number1 = 0;
      number2 = 0;
      result = '';
      finalResult = '0';
      operation = '';
      preOperation = '';
    } else if (operation == '=' && buttonText == '=') {
      if (preOperation == '+') {
        finalResult = add();
      } else if (preOperation == '-') {
        finalResult = subtract();
      } else if (preOperation == 'x') {
        finalResult = multiply();
      } else if (preOperation == '/') {
        finalResult = divide();
      }
    }
    //กดปุ่ม+ หรือกดปุ่ม- หรือกดปุ่มx หรือกดปุ่ม/ หรือกดปุ่ม=
    else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/' ||
        buttonText == '=') {
      if (number1 == 0) {
        number1 = double.parse(result);
      } else {
        number2 = double.parse(result);
      }
      //ถ้าตัวดำเนินการเท่ากับ+ ,-,*,/
      if (operation == '+') {
        //ให้finalResult ไปทำงานืั้ฟังก์ชันadd
        finalResult = add();
      } else if (operation == '-') {
        //ให้finalResult ไปทำงานืั้ฟังก์ชันsubtract
        finalResult = subtract();
      } else if (operation == 'x') {
        //ให้finalResult ไปทำงานืั้ฟังก์ชันmultiply
        finalResult = multiply();
      } else if (operation == '/') {
        //ให้finalResult ไปทำงานืั้ฟังก์ชันdivide
        finalResult = divide();
      }
      preOperation = operation;
      operation = buttonText;
      result = '';
    }
    //กดปุ่ม%
    else if (buttonText == '%') {
      result = number1 / 100;
      //flnalResultไปทำงานที่ฟังก์ชัน doesContainDecimalพร้อมทั้งส่งค่า resultไปด้วย
      finalResult = doesContainDecimal(result);
    }
    //กดปุ่ม.
    else if (buttonText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    }
    //กดปุ่ม+/-
    else if (buttonText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + buttonText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  //บวกเลข
  String add() {
    result = (number1 + number2).toString();
    number1 = double.parse(result);
    return doesContainDecimal(result);
  }

  //ลบเลข
  String subtract() {
    result = (number1 - number2).toString();
    number1 = double.parse(result);
    return doesContainDecimal(result);
  }

  //คูณเลข
  String multiply() {
    result = (number1 * number2).toString();
    number1 = double.parse(result);
    return doesContainDecimal(result);
  }

  //หารเลข
  String divide() {
    result = (number1 / number2).toString();
    number1 = double.parse(result);
    return doesContainDecimal(result);
  }

  //ผลลัพธ์
  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
