import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(KalkulatorPage());
}

class KalkulatorPage extends StatefulWidget {
  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

final C_CLEAR = "CLEAR";
final C_MULTIPLE = "X";
final C_DEVIDE = "/";
final C_ADD = "+";
final C_SUB = "-";
final C_EQUAL = "=";
final C_ZERO = "0";

class _KalkulatorPageState extends State<KalkulatorPage> {
  double _padding = 16.0;
  Color _primaryColor = Colors.red;
  Color _secondColor = Colors.yellow;

  String operator = "";
  int angka1;
  int angka2;
  String sbValue = "";
  List<String> list = new List<String>();
  String last_input = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sbValue = "";
    operator = "";
    list = new List<String>();
  }

  void appendVslue(String string) => setState(() {
    if(sbValue==C_ZERO){
      sbValue = "";
    }

        if (string == C_CLEAR) {
          sbValue = C_ZERO;
          last_input = "";
        } else {
          if (last_input.isEmpty) {
            sbValue = sbValue + string;
          }

          // if (string == C_ADD ||
          //     string == C_DEVIDE ||
          //     string == C_EQUAL ||
          //     string == C_MULTIPLE ||
          //     string == C_MINUS) {
          //   last_input = "";
          // }

          if(sbValue.substring(sbValue.length-1, sbValue.length)==C_EQUAL){

            String ss  =sbValue.replaceAll(C_SUB, "#").replaceAll(C_ADD, "#")
                .replaceAll(C_MULTIPLE, "#").replaceAll(C_DEVIDE, "#")
                .replaceAll(C_EQUAL, "#");

            var strList = ss.split(r'#');
            strList.removeLast();
            int i =0;
            strList.forEach((element) {
              print(element);
            });

            double total = 0;
            if(strList.length==3){

              total = doOperation(strList[0], strList[2], strList[1]);
            }

            sbValue = total.toString();
            
            // if(ss>3)
            // for( var i = 2 ;  ss.length>i; i=i+2 ) {
            //   if()
            //   total = tot
            // }

          }


        }
      });

  double doOperation(var bilaX, var bilbX, String opr){

    print(bilaX+"|"+bilbX+"|"+opr);

    var bila = double.parse(bilaX);
    var bilb = double.parse(bilbX);


    if(opr==C_MULTIPLE)
      return bila * bilb;
    if(opr==C_DEVIDE)
      return bila / bilb;
    if(opr==C_ADD)
      return bila + bilb;
    if(opr==C_SUB)
      return bila - bilb;
  }

  void removeLast() => setState(() {
        if (sbValue == C_ZERO) {
          return;
        }

        if(sbValue.length==1){
          sbValue = C_ZERO;
        }

        String result = sbValue.substring(0, sbValue.length - 1);
        sbValue = result;

        if(sbValue.isEmpty)
          sbValue=C_ZERO;

      });





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: _primaryColor),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Kalkulator",
            style: TextStyle(color: _secondColor),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                key: Key("expanded1"),
                flex: 1,
                child: Container(
                  key: Key("container1"),
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      AutoSizeText(
                        sbValue,
                        style: Theme.of(context).textTheme.display2,
                        maxLines: 4,
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "C",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue(C_CLEAR);
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Icon(Icons.backspace_outlined),
                              onPressed: () {
                                //TO DO
                                removeLast();
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "/",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue(C_DEVIDE);
                              },
                            )),
                      ],
                    ),
                  ),

                  // row2

                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "9",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("9");
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "8",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("8");
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "7",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("7");
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Icon(Icons.close),
                              onPressed: () {
                                //TO DO
                                appendVslue(C_MULTIPLE);
                              },
                            )),
                      ],
                    ),
                  ),

                  // row3

                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "6",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("6");
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "5",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("5");
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "4",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("4");
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue(C_SUB);
                              },
                            )),
                      ],
                    ),
                  ),

                  // row4
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "1",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("1");
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "2",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("2");
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("3");
                              },
                            )),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              color: _secondColor,
                              highlightColor: _primaryColor,
                              child: Text(
                                "=",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              onPressed: () {
                                //TO DO
                                appendVslue("=");
                              },
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
