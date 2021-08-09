import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController text = TextEditingController();
  TextEditingController shift = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool switchValue = true;
  List<String> alfabeto = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  String information = "";
  String direction = "";
  String endOfText = '';

  void caesar() {
    String texto = text.text;
    int troca = int.parse(shift.text);
    setState(() {
      for (var char in texto.characters) {
        if (alfabeto.contains(char)) {
          int position = alfabeto.indexOf(char);
          var newPosition;
          if (switchValue == false) {
            newPosition = position - troca;
            direction = "decriptação";
          } else if (switchValue == true) {
            newPosition = position + troca;
            direction = "encriptação";
          }
          if (troca > 25) {
            newPosition %= 26;
          }
          var newLetter = alfabeto[newPosition];
          endOfText += alfabeto[newPosition];
        } else {
          endOfText += char;
        }
      }
      information = "Resultado da $direction: $endOfText";
    });
  }

  void clear() {
    setState(() {
      text.text = "";
      shift.text = "";
      endOfText = "";
      information = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.black45,
            title: Text("Caesar Cipher"),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    clear();
                  }),
            ],
          ),
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 700,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset('images/Caesar.png'),
                              Text(
                                "Em criptografia, a Cifra de César, também conhecida como cifra de troca, código de César ou troca de César, é uma das mais simples e conhecidas técnicas de criptografia. É um tipo de cifra de substituição na qual cada letra do texto é substituída por outra, que se apresenta no alfabeto abaixo dela um número fixo de vezes.\n Por exemplo, com uma troca de três posições, A seria substituído por D, B se tornaria E, e assim por diante.\n\nO nome do método é em homenagem a Júlio César, que o usou para se comunicar com os seus generais.",
                                style: TextStyle(
                                    fontFamily: "Caesar Dressing",
                                    color: Colors.black,
                                    fontSize: 11),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: Form(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/comp.gif',
                        ),
                        Divider(),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ligue para Encriptar\nDesligue para Decriptar",
                                style: TextStyle(fontSize: 10),
                              ),
                              CupertinoSwitch(
                                  value: switchValue,
                                  onChanged: (value) {
                                    setState(() {
                                      switchValue = value;
                                      print(switchValue);
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Texto",
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: shift,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Troca",
                              labelStyle: TextStyle(fontSize: 15),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        TextButton(
                          child: Text('Encriptar | Decriptar'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue.shade700,
                            onSurface: Colors.grey,
                          ),
                          onPressed: () {
                            if (information.isNotEmpty) {
                              clear();
                            } else {
                              caesar();
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                information,
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
